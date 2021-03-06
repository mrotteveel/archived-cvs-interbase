(*
 * The contents of this file are subject to the Interbase Public
 * License Version 1.0 (the "License"); you may not use this file
 * except in compliance with the License. You may obtain a copy
 * of the License at http://www.Inprise.com/IPL/
 * 
 * Software distributed under the License is distributed on an
 * "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express
 * or implied. See the License for the specific language governing
 * rights and limitations under the License.
 * 
 * The Original Code was created by Inprise Corporation
 * and its predecessors. Portions created by Inprise Corporation are
 * Copyright (C) Inprise Corporation.
 * 
 * Copyright (C) 2000 Inprise Corporation
 * All Rights Reserved.
 * Contributor(s): ______________________________________.
 *)
(*
 * 
 * File generated by codes.e - do not edit!
 * 
 *)
CONST
	gds_facility		= 20;
	gds_err_base		= 335544320;
	gds_err_factor		= 1;
	gds_arg_end		= 0;	(* end of argument list *)
	gds_arg_gds		= 1;	(* generic DSRI status value *)
	gds_arg_string		= 2;	(* string argument *)
	gds_arg_cstring		= 3;	(* count & string argument *)
	gds_arg_number		= 4;	(* numeric argument (long) *)
	gds_arg_interpreted	= 5;	(* interpreted status code (string) *)
	gds_arg_vms		= 6;	(* VAX/VMS status code (long) *)
	gds_arg_unix		= 7;	(* UNIX error code *)
	gds_arg_domain		= 8;	(* Apollo/Domain error code *)
	gds_arg_dos		= 9;	(* MSDOS/OS2 error code *)

	gds__arith_except                     = 335544321;
	gds__bad_dbkey                        = 335544322;
	gds__bad_db_format                    = 335544323;
	gds__bad_db_handle                    = 335544324;
	gds__bad_dpb_content                  = 335544325;
	gds__bad_dpb_form                     = 335544326;
	gds__bad_req_handle                   = 335544327;
	gds__bad_segstr_handle                = 335544328;
	gds__bad_segstr_id                    = 335544329;
	gds__bad_tpb_content                  = 335544330;
	gds__bad_tpb_form                     = 335544331;
	gds__bad_trans_handle                 = 335544332;
	gds__bug_check                        = 335544333;
	gds__convert_error                    = 335544334;
	gds__db_corrupt                       = 335544335;
	gds__deadlock                         = 335544336;
	gds__excess_trans                     = 335544337;
	gds__from_no_match                    = 335544338;
	gds__infinap                          = 335544339;
	gds__infona                           = 335544340;
	gds__infunk                           = 335544341;
	gds__integ_fail                       = 335544342;
	gds__invalid_blr                      = 335544343;
	gds__io_error                         = 335544344;
	gds__lock_conflict                    = 335544345;
	gds__metadata_corrupt                 = 335544346;
	gds__not_valid                        = 335544347;
	gds__no_cur_rec                       = 335544348;
	gds__no_dup                           = 335544349;
	gds__no_finish                        = 335544350;
	gds__no_meta_update                   = 335544351;
	gds__no_priv                          = 335544352;
	gds__no_recon                         = 335544353;
	gds__no_record                        = 335544354;
	gds__no_segstr_close                  = 335544355;
	gds__obsolete_metadata                = 335544356;
	gds__open_trans                       = 335544357;
	gds__port_len                         = 335544358;
	gds__read_only_field                  = 335544359;
	gds__read_only_rel                    = 335544360;
	gds__read_only_trans                  = 335544361;
	gds__read_only_view                   = 335544362;
	gds__req_no_trans                     = 335544363;
	gds__req_sync                         = 335544364;
	gds__req_wrong_db                     = 335544365;
	gds__segment                          = 335544366;
	gds__segstr_eof                       = 335544367;
	gds__segstr_no_op                     = 335544368;
	gds__segstr_no_read                   = 335544369;
	gds__segstr_no_trans                  = 335544370;
	gds__segstr_no_write                  = 335544371;
	gds__segstr_wrong_db                  = 335544372;
	gds__sys_request                      = 335544373;
	gds__stream_eof                       = 335544374;
	gds__unavailable                      = 335544375;
	gds__unres_rel                        = 335544376;
	gds__uns_ext                          = 335544377;
	gds__wish_list                        = 335544378;
	gds__wrong_ods                        = 335544379;
	gds__wronumarg                        = 335544380;
	gds__imp_exc                          = 335544381;
	gds__random                           = 335544382;
	gds__fatal_conflict                   = 335544383;
	gds__badblk                           = 335544384;
	gds__invpoolcl                        = 335544385;
	gds__nopoolids                        = 335544386;
	gds__relbadblk                        = 335544387;
	gds__blktoobig                        = 335544388;
	gds__bufexh                           = 335544389;
	gds__syntaxerr                        = 335544390;
	gds__bufinuse                         = 335544391;
	gds__bdbincon                         = 335544392;
	gds__reqinuse                         = 335544393;
	gds__badodsver                        = 335544394;
	gds__relnotdef                        = 335544395;
	gds__fldnotdef                        = 335544396;
	gds__dirtypage                        = 335544397;
	gds__waifortra                        = 335544398;
	gds__doubleloc                        = 335544399;
	gds__nodnotfnd                        = 335544400;
	gds__dupnodfnd                        = 335544401;
	gds__locnotmar                        = 335544402;
	gds__badpagtyp                        = 335544403;
	gds__corrupt                          = 335544404;
	gds__badpage                          = 335544405;
	gds__badindex                         = 335544406;
	gds__dbbnotzer                        = 335544407;
	gds__tranotzer                        = 335544408;
	gds__trareqmis                        = 335544409;
	gds__badhndcnt                        = 335544410;
	gds__wrotpbver                        = 335544411;
	gds__wroblrver                        = 335544412;
	gds__wrodpbver                        = 335544413;
	gds__blobnotsup                       = 335544414;
	gds__badrelation                      = 335544415;
	gds__nodetach                         = 335544416;
	gds__notremote                        = 335544417;
	gds__trainlim                         = 335544418;
	gds__notinlim                         = 335544419;
	gds__traoutsta                        = 335544420;
	gds__connect_reject                   = 335544421;
	gds__dbfile                           = 335544422;
	gds__orphan                           = 335544423;
	gds__no_lock_mgr                      = 335544424;
	gds__ctxinuse                         = 335544425;
	gds__ctxnotdef                        = 335544426;
	gds__datnotsup                        = 335544427;
	gds__badmsgnum                        = 335544428;
	gds__badparnum                        = 335544429;
	gds__virmemexh                        = 335544430;
	gds__blocking_signal                  = 335544431;
	gds__lockmanerr                       = 335544432;
	gds__journerr                         = 335544433;
	gds__keytoobig                        = 335544434;
	gds__nullsegkey                       = 335544435;
	gds__sqlerr                           = 335544436;
	gds__wrodynver                        = 335544437;
	gds__funnotdef                        = 335544438;
	gds__funmismat                        = 335544439;
	gds__bad_msg_vec                      = 335544440;
	gds__bad_detach                       = 335544441;
	gds__noargacc_read                    = 335544442;
	gds__noargacc_write                   = 335544443;
	gds__read_only                        = 335544444;
	gds__ext_err                          = 335544445;
	gds__non_updatable                    = 335544446;
	gds__no_rollback                      = 335544447;
	gds__bad_sec_info                     = 335544448;
	gds__invalid_sec_info                 = 335544449;
	gds__misc_interpreted                 = 335544450;
	gds__update_conflict                  = 335544451;
	gds__unlicensed                       = 335544452;
	gds__obj_in_use                       = 335544453;
	gds__nofilter                         = 335544454;
	gds__shadow_accessed                  = 335544455;
	gds__invalid_sdl                      = 335544456;
	gds__out_of_bounds                    = 335544457;
	gds__invalid_dimension                = 335544458;
	gds__rec_in_limbo                     = 335544459;
	gds__shadow_missing                   = 335544460;
	gds__cant_validate                    = 335544461;
	gds__cant_start_journal               = 335544462;
	gds__gennotdef                        = 335544463;
	gds__cant_start_logging               = 335544464;
	gds__bad_segstr_type                  = 335544465;
	gds__foreign_key                      = 335544466;
	gds__high_minor                       = 335544467;
	gds__tra_state                        = 335544468;
	gds__trans_invalid                    = 335544469;
	gds__buf_invalid                      = 335544470;
	gds__indexnotdefined                  = 335544471;
	gds__login                            = 335544472;
	gds__invalid_bookmark                 = 335544473;
	gds__bad_lock_level                   = 335544474;
	gds__relation_lock                    = 335544475;
	gds__record_lock                      = 335544476;
	gds__max_idx                          = 335544477;
	gds__jrn_enable                       = 335544478;
	gds__old_failure                      = 335544479;
	gds__old_in_progress                  = 335544480;
	gds__old_no_space                     = 335544481;
	gds__no_wal_no_jrn                    = 335544482;
	gds__num_old_files                    = 335544483;
	gds__wal_file_open                    = 335544484;
	gds__bad_stmt_handle                  = 335544485;
	gds__wal_failure                      = 335544486;
	gds__walw_err                         = 335544487;
	gds__logh_small                       = 335544488;
	gds__logh_inv_version                 = 335544489;
	gds__logh_open_flag                   = 335544490;
	gds__logh_open_flag2                  = 335544491;
	gds__logh_diff_dbname                 = 335544492;
	gds__logf_unexpected_eof              = 335544493;
	gds__logr_incomplete                  = 335544494;
	gds__logr_header_small                = 335544495;
	gds__logb_small                       = 335544496;
	gds__wal_illegal_attach               = 335544497;
	gds__wal_invalid_wpb                  = 335544498;
	gds__wal_err_rollover                 = 335544499;
	gds__no_wal                           = 335544500;
	gds__drop_wal                         = 335544501;
	gds__stream_not_defined               = 335544502;
	gds__wal_subsys_error                 = 335544503;
	gds__wal_subsys_corrupt               = 335544504;
	gds__no_archive                       = 335544505;
	gds__shutinprog                       = 335544506;
	gds__range_in_use                     = 335544507;
	gds__range_not_found                  = 335544508;
	gds__charset_not_found                = 335544509;
	gds__lock_timeout                     = 335544510;
	gds__prcnotdef                        = 335544511;
	gds__prcmismat                        = 335544512;
	gds__wal_bugcheck                     = 335544513;
	gds__wal_cant_expand                  = 335544514;
	gds__codnotdef                        = 335544515;
	gds__xcpnotdef                        = 335544516;
	gds__except                           = 335544517;
	gds__cache_restart                    = 335544518;
	gds__bad_lock_handle                  = 335544519;
	gds__jrn_present                      = 335544520;
	gds__wal_err_rollover2                = 335544521;
	gds__wal_err_logwrite                 = 335544522;
	gds__wal_err_jrn_comm                 = 335544523;
	gds__wal_err_expansion                = 335544524;
	gds__wal_err_setup                    = 335544525;
	gds__wal_err_ww_sync                  = 335544526;
	gds__wal_err_ww_start                 = 335544527;
	gds__shutdown                         = 335544528;
	gds__existing_priv_mod                = 335544529;
	gds__primary_key_ref                  = 335544530;
	gds__primary_key_notnull              = 335544531;
	gds__ref_cnstrnt_notfound             = 335544532;
	gds__foreign_key_notfound             = 335544533;
	gds__ref_cnstrnt_update               = 335544534;
	gds__check_cnstrnt_update             = 335544535;
	gds__check_cnstrnt_del                = 335544536;
	gds__integ_index_seg_del              = 335544537;
	gds__integ_index_seg_mod              = 335544538;
	gds__integ_index_del                  = 335544539;
	gds__integ_index_mod                  = 335544540;
	gds__check_trig_del                   = 335544541;
	gds__check_trig_update                = 335544542;
	gds__cnstrnt_fld_del                  = 335544543;
	gds__cnstrnt_fld_rename               = 335544544;
	gds__rel_cnstrnt_update               = 335544545;
	gds__constaint_on_view                = 335544546;
	gds__invld_cnstrnt_type               = 335544547;
	gds__primary_key_exists               = 335544548;
	gds__systrig_update                   = 335544549;
	gds__not_rel_owner                    = 335544550;
	gds__grant_obj_notfound               = 335544551;
	gds__grant_fld_notfound               = 335544552;
	gds__grant_nopriv                     = 335544553;
	gds__nonsql_security_rel              = 335544554;
	gds__nonsql_security_fld              = 335544555;
	gds__wal_cache_err                    = 335544556;
	gds__shutfail                         = 335544557;
	gds__check_constraint                 = 335544558;
	gds__bad_svc_handle                   = 335544559;
	gds__shutwarn                         = 335544560;
	gds__wrospbver                        = 335544561;
	gds__bad_spb_form                     = 335544562;
	gds__svcnotdef                        = 335544563;
	gds__no_jrn                           = 335544564;
	gds__transliteration_failed           = 335544565;
	gds__start_cm_for_wal                 = 335544566;
	gds__wal_ovflow_log_required          = 335544567;
	gds__text_subtype                     = 335544568;
	gds__dsql_error                       = 335544569;
	gds__dsql_command_err                 = 335544570;
	gds__dsql_constant_err                = 335544571;
	gds__dsql_cursor_err                  = 335544572;
	gds__dsql_datatype_err                = 335544573;
	gds__dsql_decl_err                    = 335544574;
	gds__dsql_cursor_update_err           = 335544575;
	gds__dsql_cursor_open_err             = 335544576;
	gds__dsql_cursor_close_err            = 335544577;
	gds__dsql_field_err                   = 335544578;
	gds__dsql_internal_err                = 335544579;
	gds__dsql_relation_err                = 335544580;
	gds__dsql_procedure_err               = 335544581;
	gds__dsql_request_err                 = 335544582;
	gds__dsql_sqlda_err                   = 335544583;
	gds__dsql_var_count_err               = 335544584;
	gds__dsql_stmt_handle                 = 335544585;
	gds__dsql_function_err                = 335544586;
	gds__dsql_blob_err                    = 335544587;
	gds__collation_not_found              = 335544588;
	gds__collation_not_for_charset        = 335544589;
	gds__dsql_dup_option                  = 335544590;
	gds__dsql_tran_err                    = 335544591;
	gds__dsql_invalid_array               = 335544592;
	gds__dsql_max_arr_dim_exceeded        = 335544593;
	gds__dsql_arr_range_error             = 335544594;
	gds__dsql_trigger_err                 = 335544595;
	gds__dsql_subselect_err               = 335544596;
	gds__dsql_crdb_prepare_err            = 335544597;
	gds__specify_field_err                = 335544598;
	gds__num_field_err                    = 335544599;
	gds__col_name_err                     = 335544600;
	gds__where_err                        = 335544601;
	gds__table_view_err                   = 335544602;
	gds__distinct_err                     = 335544603;
	gds__key_field_count_err              = 335544604;
	gds__subquery_err                     = 335544605;
	gds__expression_eval_err              = 335544606;
	gds__node_err                         = 335544607;
	gds__command_end_err                  = 335544608;
	gds__index_name                       = 335544609;
	gds__exception_name                   = 335544610;
	gds__field_name                       = 335544611;
	gds__token_err                        = 335544612;
	gds__union_err                        = 335544613;
	gds__dsql_construct_err               = 335544614;
	gds__field_aggregate_err              = 335544615;
	gds__field_ref_err                    = 335544616;
	gds__order_by_err                     = 335544617;
	gds__return_mode_err                  = 335544618;
	gds__extern_func_err                  = 335544619;
	gds__alias_conflict_err               = 335544620;
	gds__procedure_conflict_error         = 335544621;
	gds__relation_conflict_err            = 335544622;
	gds__dsql_domain_err                  = 335544623;
	gds__idx_seg_err                      = 335544624;
	gds__node_name_err                    = 335544625;
	gds__table_name                       = 335544626;
	gds__proc_name                        = 335544627;
	gds__idx_create_err                   = 335544628;
	gds__wal_shadow_err                   = 335544629;
	gds__dependency                       = 335544630;
	gds__idx_key_err                      = 335544631;
	gds__dsql_file_length_err             = 335544632;
	gds__dsql_shadow_number_err           = 335544633;
	gds__dsql_token_unk_err               = 335544634;
	gds__dsql_no_relation_alias           = 335544635;
	gds__indexname                        = 335544636;
	gds__no_stream_plan                   = 335544637;
	gds__stream_twice                     = 335544638;
	gds__stream_not_found                 = 335544639;
	gds__collation_requires_text          = 335544640;
	gds__dsql_domain_not_found            = 335544641;
	gds__index_unused                     = 335544642;
	gds__dsql_self_join                   = 335544643;
	gds__stream_bof                       = 335544644;
	gds__stream_crack                     = 335544645;
	gds__db_or_file_exists                = 335544646;
	gds__invalid_operator                 = 335544647;
	gds__conn_lost                        = 335544648;
	gds__bad_checksum                     = 335544649;
	gds__page_type_err                    = 335544650;
	gds__ext_readonly_err                 = 335544651;
	gds__sing_select_err                  = 335544652;
	gds__psw_attach                       = 335544653;
	gds__psw_start_trans                  = 335544654;
	gds__invalid_direction                = 335544655;
	gds__dsql_var_conflict                = 335544656;
	gds__dsql_no_blob_array               = 335544657;
	gds__dsql_base_table                  = 335544658;
	gds__duplicate_base_table             = 335544659;
	gds__view_alias                       = 335544660;
	gds__index_root_page_full             = 335544661;
	gds__dsql_blob_type_unknown           = 335544662;
	gds__req_max_clones_exceeded          = 335544663;
	gds__dsql_duplicate_spec              = 335544664;
	gds__unique_key_violation             = 335544665;
	gds__srvr_version_too_old             = 335544666;
	gds__drdb_completed_with_errs         = 335544667;
	gds__dsql_procedure_use_err           = 335544668;
	gds__dsql_count_mismatch              = 335544669;
	gds__blob_idx_err                     = 335544670;
	gds__array_idx_err                    = 335544671;
	gds__key_field_err                    = 335544672;
	gds__no_delete                        = 335544673;
	gds__del_last_field                   = 335544674;
	gds__sort_err                         = 335544675;
	gds__sort_mem_err                     = 335544676;
	gds__version_err                      = 335544677;
	gds__inval_key_posn                   = 335544678;
	gds__no_segments_err                  = 335544679;
	gds__crrp_data_err                    = 335544680;
	gds__rec_size_err                     = 335544681;
	gds__dsql_field_ref                   = 335544682;
	gds__req_depth_exceeded               = 335544683;
	gds__no_field_access                  = 335544684;
	gds__no_dbkey                         = 335544685;
	gds__jrn_format_err                   = 335544686;
	gds__jrn_file_full                    = 335544687;
	gds__dsql_open_cursor_request         = 335544688;
	gds__ib_error                         = 335544689;
	gds__cache_redef                      = 335544690;
	gds__cache_too_small                  = 335544691;
	gds__log_redef                        = 335544692;
	gds__log_too_small                    = 335544693;
	gds__partition_too_small              = 335544694;
	gds__partition_not_supp               = 335544695;
	gds__log_length_spec                  = 335544696;
	gds__precision_err                    = 335544697;
	gds__scale_nogt                       = 335544698;
	gds__expec_short                      = 335544699;
	gds__expec_long                       = 335544700;
	gds__expec_ushort                     = 335544701;
	gds__like_escape_invalid              = 335544702;
	gds__svcnoexe                         = 335544703;
	gds__net_lookup_err                   = 335544704;
	gds__service_unknown                  = 335544705;
	gds__host_unknown                     = 335544706;
	gds__grant_nopriv_on_base             = 335544707;
	gds__dyn_fld_ambiguous                = 335544708;
	gds__dsql_agg_ref_err                 = 335544709;
	gds__complex_view                     = 335544710;
	gds__unprepared_stmt                  = 335544711;
	gds__expec_positive                   = 335544712;
	gds__dsql_sqlda_value_err             = 335544713;
	gds__invalid_array_id                 = 335544714;
	gds__extfile_uns_op                   = 335544715;
	gds__svc_in_use                       = 335544716;
	gds__err_stack_limit                  = 335544717;
	gds__invalid_key                      = 335544718;
	gds__net_init_error                   = 335544719;
	gds__loadlib_failure                  = 335544720;
	gds__network_error                    = 335544721;
	gds__net_connect_err                  = 335544722;
	gds__net_connect_listen_err           = 335544723;
	gds__net_event_connect_err            = 335544724;
	gds__net_event_listen_err             = 335544725;
	gds__net_read_err                     = 335544726;
	gds__net_write_err                    = 335544727;
	gds__integ_index_deactivate           = 335544728;
	gds__integ_deactivate_primary         = 335544729;
	gds__cse_not_supported                = 335544730;
	gds__tra_must_sweep                   = 335544731;
	gds__unsupported_network_drive        = 335544732;
	gds__io_create_err                    = 335544733;
	gds__io_open_err                      = 335544734;
	gds__io_close_err                     = 335544735;
	gds__io_read_err                      = 335544736;
	gds__io_write_err                     = 335544737;
	gds__io_delete_err                    = 335544738;
	gds__io_access_err                    = 335544739;
	gds__udf_exception                    = 335544740;
	gds__lost_db_connection               = 335544741;
	gds__no_write_user_priv               = 335544742;
	gds__token_too_long                   = 335544743;
	gds__max_att_exceeded                 = 335544744;
	gds__login_same_as_role_name          = 335544745;
	gds__reftable_requires_pk             = 335544746;
	gds__usrname_too_long                 = 335544747;
	gds__password_too_long                = 335544748;
	gds__usrname_required                 = 335544749;
	gds__password_required                = 335544750;
	gds__bad_protocol                     = 335544751;
	gds__dup_usrname_found                = 335544752;
	gds__usrname_not_found                = 335544753;
	gds__error_adding_sec_record          = 335544754;
	gds__error_modifying_sec_record       = 335544755;
	gds__error_deleting_sec_record        = 335544756;
	gds__error_updating_sec_db            = 335544757;
	gds__sort_rec_size_err                = 335544758;
	gds__bad_default_value                = 335544759;
	gds__invalid_clause                   = 335544760;
	gds__too_many_handles                 = 335544761;
	gds__optimizer_blk_exc                = 335544762;
	gds__invalid_string_constant          = 335544763;
	gds__transitional_date                = 335544764;
	gds__read_only_database               = 335544765;
	gds__must_be_dialect_2_and_up         = 335544766;
	gds__blob_filter_exception            = 335544767;
	gds__exception_access_violation       = 335544768;
	gds__exception_datatype_missalignment = 335544769;
	gds__exception_array_bounds_exceeded  = 335544770;
	gds__exception_float_denormal_operand = 335544771;
	gds__exception_float_divide_by_zero   = 335544772;
	gds__exception_float_inexact_result   = 335544773;
	gds__exception_float_invalid_operand  = 335544774;
	gds__exception_float_overflow         = 335544775;
	gds__exception_float_stack_check      = 335544776;
	gds__exception_float_underflow        = 335544777;
	gds__exception_integer_divide_by_zero = 335544778;
	gds__exception_integer_overflow       = 335544779;
	gds__exception_unknown                = 335544780;
	gds__exception_stack_overflow         = 335544781;
	gds__exception_sigsegv                = 335544782;
	gds__exception_sigill                 = 335544783;
	gds__exception_sigbus                 = 335544784;
	gds__exception_sigfpe                 = 335544785;
	gds__ext_file_delete                  = 335544786;
	gds__ext_file_modify                  = 335544787;
	gds__adm_task_denied                  = 335544788;
	gds__extract_input_mismatch           = 335544789;
	gds__insufficient_svc_privileges      = 335544790;
	gds__file_in_use                      = 335544791;
	gds__service_att_err                  = 335544792;
	gds__ddl_not_allowed_by_db_sql_dial   = 335544793;
	gds__cancelled                        = 335544794;
	gds__unexp_spb_form                   = 335544795;
	gds__sql_dialect_datatype_unsupport   = 335544796;
	gds__svcnouser                        = 335544797;
	gds__depend_on_uncommitted_rel        = 335544798;
	gds__svc_name_missing                 = 335544799;
	gds__too_many_contexts                = 335544800;
	gds__datype_notsup                    = 335544801;
	gds__dialect_reset_warning            = 335544802;
	gds__dialect_not_changed              = 335544803;
	gds__database_create_failed           = 335544804;
	gds__inv_dialect_specified            = 335544805;
	gds__valid_db_dialects                = 335544806;
	gds__sqlwarn                          = 335544807;
	gds__dtype_renamed                    = 335544808;
	gds__extern_func_dir_error            = 335544809;
	gds__date_range_exceeded              = 335544810;
	gds__inv_client_dialect_specified     = 335544811;
	gds__valid_client_dialects            = 335544812;
	gds__optimizer_between_err            = 335544813;
	gds__service_not_supported            = 335544814;
	gds__gfix_db_name                     = 335740929;
	gds__gfix_invalid_sw                  = 335740930;
	gds__gfix_incmp_sw                    = 335740932;
	gds__gfix_replay_req                  = 335740933;
	gds__gfix_pgbuf_req                   = 335740934;
	gds__gfix_val_req                     = 335740935;
	gds__gfix_pval_req                    = 335740936;
	gds__gfix_trn_req                     = 335740937;
	gds__gfix_full_req                    = 335740940;
	gds__gfix_usrname_req                 = 335740941;
	gds__gfix_pass_req                    = 335740942;
	gds__gfix_subs_name                   = 335740943;
	gds__gfix_wal_req                     = 335740944;
	gds__gfix_sec_req                     = 335740945;
	gds__gfix_nval_req                    = 335740946;
	gds__gfix_type_shut                   = 335740947;
	gds__gfix_retry                       = 335740948;
	gds__gfix_retry_db                    = 335740951;
	gds__gfix_exceed_max                  = 335740991;
	gds__gfix_corrupt_pool                = 335740992;
	gds__gfix_mem_exhausted               = 335740993;
	gds__gfix_bad_pool                    = 335740994;
	gds__gfix_trn_not_valid               = 335740995;
	gds__gfix_unexp_eoi                   = 335741012;
	gds__gfix_recon_fail                  = 335741018;
	gds__gfix_trn_unknown                 = 335741036;
	gds__gfix_mode_req                    = 335741038;
	gds__gfix_opt_SQL_dialect             = 335741039;
	gds__dsql_dbkey_from_non_table        = 336003074;
	gds__dsql_transitional_numeric        = 336003075;
	gds__dsql_dialect_warning_expr        = 336003076;
	gds__sql_db_dialect_dtype_unsupport   = 336003077;
	gds__isc_sql_dialect_conflict_num     = 336003079;
	gds__dsql_warning_number_ambiguous    = 336003080;
	gds__dsql_warning_number_ambiguous1   = 336003081;
	gds__dsql_warn_precision_ambiguous    = 336003082;
	gds__dsql_warn_precision_ambiguous1   = 336003083;
	gds__dsql_warn_precision_ambiguous2   = 336003084;
	gds__dyn_role_does_not_exist          = 336068796;
	gds__dyn_no_grant_admin_opt           = 336068797;
	gds__dyn_user_not_role_member         = 336068798;
	gds__dyn_delete_role_failed           = 336068799;
	gds__dyn_grant_role_to_user           = 336068800;
	gds__dyn_inv_sql_role_name            = 336068801;
	gds__dyn_dup_sql_role                 = 336068802;
	gds__dyn_kywd_spec_for_role           = 336068803;
	gds__dyn_roles_not_supported          = 336068804;
	gds__dyn_domain_name_exists           = 336068812;
	gds__dyn_field_name_exists            = 336068813;
	gds__dyn_dependency_exists            = 336068814;
	gds__dyn_dtype_invalid                = 336068815;
	gds__dyn_char_fld_too_small           = 336068816;
	gds__dyn_invalid_dtype_conversion     = 336068817;
	gds__dyn_dtype_conv_invalid           = 336068818;
	gds__gbak_unknown_switch              = 336330753;
	gds__gbak_page_size_missing           = 336330754;
	gds__gbak_page_size_toobig            = 336330755;
	gds__gbak_redir_ouput_missing         = 336330756;
	gds__gbak_switches_conflict           = 336330757;
	gds__gbak_unknown_device              = 336330758;
	gds__gbak_no_protection               = 336330759;
	gds__gbak_page_size_not_allowed       = 336330760;
	gds__gbak_multi_source_dest           = 336330761;
	gds__gbak_filename_missing            = 336330762;
	gds__gbak_dup_inout_names             = 336330763;
	gds__gbak_inv_page_size               = 336330764;
	gds__gbak_db_specified                = 336330765;
	gds__gbak_db_exists                   = 336330766;
	gds__gbak_unk_device                  = 336330767;
	gds__gbak_blob_info_failed            = 336330772;
	gds__gbak_unk_blob_item               = 336330773;
	gds__gbak_get_seg_failed              = 336330774;
	gds__gbak_close_blob_failed           = 336330775;
	gds__gbak_open_blob_failed            = 336330776;
	gds__gbak_put_blr_gen_id_failed       = 336330777;
	gds__gbak_unk_type                    = 336330778;
	gds__gbak_comp_req_failed             = 336330779;
	gds__gbak_start_req_failed            = 336330780;
	gds__gbak_rec_failed                  = 336330781;
	gds__gbak_rel_req_failed              = 336330782;
	gds__gbak_db_info_failed              = 336330783;
	gds__gbak_no_db_desc                  = 336330784;
	gds__gbak_db_create_failed            = 336330785;
	gds__gbak_decomp_len_error            = 336330786;
	gds__gbak_tbl_missing                 = 336330787;
	gds__gbak_blob_col_missing            = 336330788;
	gds__gbak_create_blob_failed          = 336330789;
	gds__gbak_put_seg_failed              = 336330790;
	gds__gbak_rec_len_exp                 = 336330791;
	gds__gbak_inv_rec_len                 = 336330792;
	gds__gbak_exp_data_type               = 336330793;
	gds__gbak_gen_id_failed               = 336330794;
	gds__gbak_unk_rec_type                = 336330795;
	gds__gbak_inv_bkup_ver                = 336330796;
	gds__gbak_missing_bkup_desc           = 336330797;
	gds__gbak_string_trunc                = 336330798;
	gds__gbak_cant_rest_record            = 336330799;
	gds__gbak_send_failed                 = 336330800;
	gds__gbak_no_tbl_name                 = 336330801;
	gds__gbak_unexp_eof                   = 336330802;
	gds__gbak_db_format_too_old           = 336330803;
	gds__gbak_inv_array_dim               = 336330804;
	gds__gbak_xdr_len_expected            = 336330807;
	gds__gbak_open_bkup_error             = 336330817;
	gds__gbak_open_error                  = 336330818;
	gds__gbak_missing_block_fac           = 336330934;
	gds__gbak_inv_block_fac               = 336330935;
	gds__gbak_block_fac_specified         = 336330936;
	gds__gbak_missing_username            = 336330940;
	gds__gbak_missing_password            = 336330941;
	gds__gbak_missing_skipped_bytes       = 336330952;
	gds__gbak_inv_skipped_bytes           = 336330953;
	gds__gbak_err_restore_charset         = 336330965;
	gds__gbak_err_restore_collation       = 336330967;
	gds__gbak_read_error                  = 336330972;
	gds__gbak_write_error                 = 336330973;
	gds__gbak_db_in_use                   = 336330985;
	gds__gbak_sysmemex                    = 336330990;
	gds__gbak_restore_role_failed         = 336331002;
	gds__gbak_role_op_missing             = 336331005;
	gds__gbak_page_buffers_missing        = 336331010;
	gds__gbak_page_buffers_wrong_param    = 336331011;
	gds__gbak_page_buffers_restore        = 336331012;
	gds__gbak_inv_size                    = 336331014;
	gds__gbak_file_outof_sequence         = 336331015;
	gds__gbak_join_file_missing           = 336331016;
	gds__gbak_stdin_not_supptd            = 336331017;
	gds__gbak_stdout_not_supptd           = 336331018;
	gds__gbak_bkup_corrupt                = 336331019;
	gds__gbak_unk_db_file_spec            = 336331020;
	gds__gbak_hdr_write_failed            = 336331021;
	gds__gbak_disk_space_ex               = 336331022;
	gds__gbak_size_lt_min                 = 336331023;
	gds__gbak_svc_name_missing            = 336331025;
	gds__gbak_not_ownr                    = 336331026;
	gds__gbak_mode_req                    = 336331031;
	gds__gsec_cant_open_db                = 336723983;
	gds__gsec_switches_error              = 336723984;
	gds__gsec_no_op_spec                  = 336723985;
	gds__gsec_no_usr_name                 = 336723986;
	gds__gsec_err_add                     = 336723987;
	gds__gsec_err_modify                  = 336723988;
	gds__gsec_err_find_mod                = 336723989;
	gds__gsec_err_rec_not_found           = 336723990;
	gds__gsec_err_delete                  = 336723991;
	gds__gsec_err_find_del                = 336723992;
	gds__gsec_err_find_disp               = 336723996;
	gds__gsec_inv_param                   = 336723997;
	gds__gsec_op_specified                = 336723998;
	gds__gsec_pw_specified                = 336723999;
	gds__gsec_uid_specified               = 336724000;
	gds__gsec_gid_specified               = 336724001;
	gds__gsec_proj_specified              = 336724002;
	gds__gsec_org_specified               = 336724003;
	gds__gsec_fname_specified             = 336724004;
	gds__gsec_mname_specified             = 336724005;
	gds__gsec_lname_specified             = 336724006;
	gds__gsec_inv_switch                  = 336724008;
	gds__gsec_amb_switch                  = 336724009;
	gds__gsec_no_op_specified             = 336724010;
	gds__gsec_params_not_allowed          = 336724011;
	gds__gsec_incompat_switch             = 336724012;
	gds__gsec_inv_username                = 336724044;
	gds__gsec_inv_pw_length               = 336724045;
	gds__gsec_db_specified                = 336724046;
	gds__gsec_db_admin_specified          = 336724047;
	gds__gsec_db_admin_pw_specified       = 336724048;
	gds__gsec_sql_role_specified          = 336724049;
	gds__license_no_file                  = 336789504;
	gds__license_op_specified             = 336789523;
	gds__license_op_missing               = 336789524;
	gds__license_inv_switch               = 336789525;
	gds__license_inv_switch_combo         = 336789526;
	gds__license_inv_op_combo             = 336789527;
	gds__license_amb_switch               = 336789528;
	gds__license_inv_parameter            = 336789529;
	gds__license_param_specified          = 336789530;
	gds__license_param_req                = 336789531;
	gds__license_syntx_error              = 336789532;
	gds__license_dup_id                   = 336789534;
	gds__license_inv_id_key               = 336789535;
	gds__license_err_remove               = 336789536;
	gds__license_err_update               = 336789537;
	gds__license_err_convert              = 336789538;
	gds__license_err_unk                  = 336789539;
	gds__license_svc_err_add              = 336789540;
	gds__license_svc_err_remove           = 336789541;
	gds__license_eval_exists              = 336789563;
	gds__gstat_unknown_switch             = 336920577;
	gds__gstat_retry                      = 336920578;
	gds__gstat_wrong_ods                  = 336920579;
	gds__gstat_unexpected_eof             = 336920580;
	gds__gstat_open_err                   = 336920605;
	gds__gstat_read_err                   = 336920606;
	gds__gstat_sysmemex                   = 336920607;
