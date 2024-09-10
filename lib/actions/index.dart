library actions;

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_db/actions/app_actions.dart';
import 'package:movie_db/models/index.dart';
import 'package:redux_thunk/redux_thunk.dart';

part 'index.freezed.dart';
part 'reload_products.dart';
part 'get_product_details.dart';
part 'select_product_entry.dart';
part 'get_product_by_barcode.dart';
part 'create_reception.dart';
part 'finalize_reception.dart';
part 'create_new_entry.dart';
part 'save_reception.dart';
part 'email_reception.dart';
part 'show_reception_result.dart';
part 'remove_entry_action.dart';
part 'load_pending_receptions.dart';
part 'send_pending_action.dart';