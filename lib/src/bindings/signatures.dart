import "dart:ffi";
import 'structs.dart';

// common functions
typedef obx_version_native_t = Void Function(Pointer<Int32> major, Pointer<Int32> minor, Pointer<Int32> patch);
typedef obx_version_string_native_t = Pointer<Uint8> Function();
typedef obx_free_t<T extends NativeType> = Void Function(Pointer<T> ptr);
typedef obx_free_struct_native_t = Void Function(Pointer<Uint64> structPtr);

// error info
typedef obx_last_error_code_native_t = Int32 Function();
typedef obx_last_error_message_native_t = Pointer<Uint8> Function();
typedef obx_last_error_secondary_native_t = Int32 Function();
typedef obx_last_error_clear_native_t = Void Function();

// schema model creation
typedef obx_model_native_t = Pointer<Void> Function();
typedef obx_model_free_native_t = Int32 Function(Pointer<Void>);
typedef obx_model_entity_native_t = Int32 Function(
    Pointer<Void> model, Pointer<Uint8> name, Uint32 entity_id, Uint64 entity_uid);
typedef obx_model_property_native_t = Int32 Function(
    Pointer<Void> model, Pointer<Uint8> name, Uint32 type, Uint64 property_id, Uint64 property_uid);
typedef obx_model_property_flags_native_t = Int32 Function(Pointer<Void> model, Uint32 flags);
typedef obx_model_entity_last_property_id_native_t = Int32 Function(
    Pointer<Void> model, Uint32 property_id, Uint64 property_uid);
typedef obx_model_last_entity_id_native_t = Int32 Function(Pointer<Void> model, Uint32 entity_id, Uint64 entity_uid);

// object store management
typedef obx_opt_native_t = Pointer<Void> Function();
typedef obx_opt_directory_native_t = Int32 Function(Pointer<Void> opt, Pointer<Uint8> dir);
typedef obx_opt_max_db_size_in_kb_native_t = Void Function(Pointer<Void> opt, Int32 size_in_kb);
typedef obx_opt_file_mode_native_t = Void Function(Pointer<Void> opt, Int32 file_mode);
typedef obx_opt_max_readers_native_t = Void Function(Pointer<Void> opt, Int32 max_readers);
typedef obx_opt_model_native_t = Int32 Function(Pointer<Void> opt, Pointer<Void> model);
typedef obx_store_open_native_t = Pointer<Void> Function(Pointer<Void> opt);
typedef obx_store_close_native_t = Int32 Function(Pointer<Void> store);

// transactions
typedef obx_txn_write_native_t = Pointer<Void> Function(Pointer<Void> store);
typedef obx_txn_read_native_t = Pointer<Void> Function(Pointer<Void> store);
typedef obx_txn_close_native_t = Int32 Function(Pointer<Void> txn);
typedef obx_txn_abort_native_t = Int32 Function(Pointer<Void> txn);
typedef obx_txn_success_native_t = Int32 Function(Pointer<Void> txn);

// box management
typedef obx_box_native_t = Pointer<Void> Function(Pointer<Void> store, Uint32 entity_id);
typedef obx_box_contains_native_t = Int32 Function(Pointer<Void> box, Uint64 id, Pointer<Int8> out_contains);
typedef obx_box_contains_many_native_t = Int32 Function(
    Pointer<Void> box, Pointer<Uint64> ids, Pointer<Int8> out_contains);
typedef obx_box_get_native_t = Int32 Function(
    Pointer<Void> box, Uint64 id, Pointer<Pointer<Void>> data, Pointer<Int32> size);
typedef obx_box_get_many_native_t = Pointer<Uint64> Function(Pointer<Void> box, Pointer<OBX_id_array> ids);
typedef obx_box_get_all_native_t = Pointer<Uint64> Function(Pointer<Void> box);
typedef obx_box_id_for_put_native_t = Uint64 Function(Pointer<Void> box, Uint64 id_or_zero);
typedef obx_box_ids_for_put_native_t = Int32 Function(Pointer<Void> box, Uint64 count, Pointer<Uint64> out_first_id);
typedef obx_box_put_native_t = Int32 Function(Pointer<Void> box, Uint64 id, Pointer<Void> data, Int32 size, Int32 mode);
typedef obx_box_put_many_native_t = Int32 Function(
    Pointer<Void> box, Pointer<Uint64> objects, Pointer<Uint64> ids, Int32 mode);
typedef obx_box_remove_native_t = Int32 Function(Pointer<Void> box, Uint64 id);

// no typedef for non-functions yet, see https://github.com/dart-lang/sdk/issues/2626
// typedef obx_err = Int32
// typedef Pointer<Int8> -> char[]
// typedef Pointer<Int32> -> int (e.g. obx_qb_cond);

// query builider
typedef obx_query_builder_native_t = Pointer<Void> Function(Pointer<Void> store, Uint32 entity_id);
typedef obx_query_builder_dart_t = Pointer<Void> Function(Pointer<Void> store, int entity_id);

typedef obx_qb_close_native_t = Int32 Function(Pointer<Void> builder);
typedef obx_qb_close_dart_t = int Function(Pointer<Void> builder);

typedef obx_qb_error_message_t = Pointer<Uint8> Function(Pointer<Void> builder);

typedef obx_qb_cond_operator_0_native_t = Int32 Function(Pointer<Void> builder, Uint32 property_id);
typedef obx_qb_cond_operator_0_dart_t = int Function(Pointer<Void> builder, int property_id);

typedef obx_qb_cond_operator_1_native_t<P> = Int32 Function(Pointer<Void> builder, Uint32 property_id, P value);
typedef obx_qb_cond_operator_1_dart_t<P> = int Function(Pointer<Void> builder, int property_id, P value);

typedef obx_qb_cond_operator_2_native_t<P> = Int32 Function(Pointer<Void> builder, Uint32 property_id, P v1, P v2);
typedef obx_qb_cond_operator_2_dart_t<P> = int Function(Pointer<Void> builder, int property_id, P v1, P v2);

typedef obx_qb_cond_operator_in_native_t<P> = Int32 Function(
    Pointer<Void> builder, Uint32 property_id, Pointer<P> values, Uint64 count);
typedef obx_qb_cond_operator_in_dart_t<P> = int Function(
    Pointer<Void> builder, int property_id, Pointer<P> values, int count);

typedef obx_qb_join_op_native_t = Int32 Function(Pointer<Void> builder, Pointer<Int32> cond_array, Uint64 count);
typedef obx_qb_join_op_dart_t = int Function(Pointer<Void> builder, Pointer<Int32> cond_array, int count);

typedef obx_qb_cond_string_op_1_native_t = Int32 Function(
    Pointer<Void> builder, Uint32 property_id, Pointer<Uint8> value, Int8 case_sensitive);
typedef obx_qb_cond_string_op_1_dart_t = int Function(
    Pointer<Void> builder, int property_id, Pointer<Uint8> value, int case_sensitive);

typedef obx_qb_string_lt_gt_op_native_t = Int32 Function(
    Pointer<Void> builder, Uint32 property_id, Pointer<Uint8> value, Int8 case_sensitive, Int8 with_equal);
typedef obx_qb_string_lt_gt_op_dart_t = int Function(
    Pointer<Void> builder, int property_id, Pointer<Uint8> value, int case_sensitive, int with_equal);

typedef obx_qb_string_in_native_t = Int32 Function(
    Pointer<Void> builder, Uint32 property_id, Pointer<Pointer<Uint8>> value, Uint64 count, Int8 case_sensitive);
typedef obx_qb_string_in_dart_t = int Function(
    Pointer<Void> builder, int property_id, Pointer<Pointer<Uint8>> value, int count, int case_sensitive);

typedef obx_qb_bytes_eq_native_t = Int32 Function(
    Pointer<Void> builder, Uint32 property_id, Pointer<Void> value, Uint64 size);
typedef obx_qb_bytes_eq_dart_t = int Function(Pointer<Void> builder, int property_id, Pointer<Void> value, int size);

typedef obx_qb_bytes_lt_gt_native_t = Int32 Function(
    Pointer<Void> builder, Uint32 property_id, Pointer<Void> value, Uint64 size, Int8 with_equal);
typedef obx_qb_bytes_lt_gt_dart_t = int Function(
    Pointer<Void> builder, int property_id, Pointer<Void> value, int size, int with_equal);

typedef obx_qb_param_alias_native_t = Int32 Function(Pointer<Void> builder, Pointer<Uint8> alias);
typedef obx_qb_param_alias_dart_t = int Function(Pointer<Void> builder, Pointer<Uint8> alias);

typedef obx_qb_order_native_t = Int32 Function(Pointer<Void> builder, Uint32 property_id, Uint32 flags);
typedef obx_qb_order_dart_t = int Function(Pointer<Void> builder, int property_id, int flags);

// query

typedef obx_query_t = Pointer<Void> Function(Pointer<Void> builder);

typedef obx_query_close_native_t = Int32 Function(Pointer<Void> query);
typedef obx_query_close_dart_t = int Function(Pointer<Void> query);

typedef obx_query_find_t<T> = Pointer<Uint64> Function(Pointer<Void> query, T offset, T limit);
typedef obx_query_find_ids_t<T> = Pointer<OBX_id_array> Function(Pointer<Void> query, T offset, T limit);

typedef obx_query_count_native_t = Int32 Function(Pointer<Void> query, Pointer<Uint64> count);
typedef obx_query_count_dart_t = int Function(Pointer<Void> query, Pointer<Uint64> count);

typedef obx_query_describe_t = Pointer<Uint8> Function(Pointer<Void> query);

typedef obx_query_visit_native_t = Int32 Function(
    Pointer<Void> query, Pointer<Void> visitor, Pointer<Void> user_data, Uint64 offset, Uint64 limit);
typedef obx_query_visit_dart_t = int Function(
    Pointer<Void> query, Pointer<Void> visitor, Pointer<Void> user_data, int offset, int limit);
