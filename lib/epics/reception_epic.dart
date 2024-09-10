import 'package:flutter/material.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:movie_db/actions/app_actions.dart';
import 'package:movie_db/actions/index.dart';
import 'package:movie_db/data/reception_api.dart';
import 'package:movie_db/models/index.dart';
import 'package:movie_db/strings.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class ReceptionEpics {
  ReceptionEpics({required ReceptionApi api}) : _receptionApi = api;

  final ReceptionApi _receptionApi;

  Epic<AppState> get epics {
    return combineEpics<AppState>(<Epic<AppState>>[
      TypedEpic<AppState, CreateReceptionActionStart>(_createReception),
      TypedEpic<AppState, FinalizeReceptionActionStart>(_finalizeReception),
      TypedEpic<AppState, ShowFeedbackActionStart>(_showReceptionResult),
      TypedEpic<AppState, RemoveEntryActionStart>(_removeEntry),
      TypedEpic<AppState, LoadPendingReceptionsActionStart>(_loadPendingReceptions),
      TypedEpic<AppState, SendPendingActionStart>(_sendPendingReceptions),
    ]);
  }

  Stream<AppAction> _createReception(Stream<CreateReceptionActionStart> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((CreateReceptionActionStart action) => Reception((ReceptionBuilder b) {
              b
                ..company = action.company
                ..invoiceNr = action.invoiceNr
                ..creatorName = action.user;
            }))
        .map((Reception reception) {
          NavigatorHolder.navigatorKey.currentState?.pushNamed(Routes.newReception);
          return CreateReceptionAction.successful(reception: reception);
        })
        .onErrorReturnWith(
      (Object error, StackTrace stackTrace) {
        return CreateReceptionAction.error(error: error, stackTrace: stackTrace);
      },
    );
  }

  Stream<AppAction> _finalizeReception(Stream<FinalizeReceptionActionStart> actions, EpicStore<AppState> store) {
    return actions //
        .asyncMap((FinalizeReceptionActionStart action) => _receptionApi.finalizeReception(action.reception))
        .map((String message) {
          NavigatorHolder.navigatorKey.currentState?.popUntil((Route route) => route.isFirst);
          return FinalizeReceptionAction.successful(message: message);
        })
        .onErrorReturnWith(
      (Object error, StackTrace stackTrace) {
        return FinalizeReceptionAction.error(error: error, stackTrace: stackTrace);
      },
    );
  }

  Stream<AppAction> _showReceptionResult(Stream<ShowFeedbackActionStart> actions, EpicStore<AppState> store) {
    return actions //
        .asyncMap((ShowFeedbackActionStart action) => _receptionApi.showResponse(action.context, action.message))
        .map((_) => const ShowFeedbackAction.successful())
        .onErrorReturnWith(
      (Object error, StackTrace stackTrace) {
        return ShowFeedbackAction.error(error: error, stackTrace: stackTrace);
      },
    );
  }

  Stream<AppAction> _removeEntry(Stream<RemoveEntryActionStart> actions, EpicStore<AppState> store) {
    return actions //
        .asyncMap((RemoveEntryActionStart action) => store.state.ongoingReception!.entries.firstWhere((ProductEntry e) => e.id == action.id))
        .map((ProductEntry entry) => RemoveEntryAction.successful(entry: entry))
        .onErrorReturnWith(
          (Object error, StackTrace stackTrace) {
        return RemoveEntryAction.error(error: error, stackTrace: stackTrace);
      },
    );

  }

  Stream<AppAction> _loadPendingReceptions(Stream<LoadPendingReceptionsActionStart> actions, EpicStore<AppState> store) {
    return actions //
        .asyncMap((LoadPendingReceptionsActionStart action) => _receptionApi.getPendingReceptions())
        .map((List<String> receptions) => LoadPendingReceptionsAction.successful(receptions: receptions))
        .onErrorReturnWith(
          (Object error, StackTrace stackTrace) {
        return LoadPendingReceptionsAction.error(error: error, stackTrace: stackTrace);
      },
    );
  }

  Stream<AppAction> _sendPendingReceptions(Stream<SendPendingActionStart> actions, EpicStore<AppState> store) {
    return actions //
        .asyncMap((SendPendingActionStart action) => _receptionApi.sendPendingReceptions(action.pendingReceptions))
        .map((_) => const SendPendingAction.successful())
        .onErrorReturnWith(
          (Object error, StackTrace stackTrace) {
        return SendPendingAction.error(error: error, stackTrace: stackTrace);
      },
    );
  }
}
