WITH histogram_lists AS (
  SELECT
    document_id,
    udf.main_summary_scalars(payload.processes).*,
    ARRAY(
      SELECT AS STRUCT
        udf.null_if_empty_list(
          udf.json_extract_int_map(JSON_EXTRACT(histogram, '$.values'))
        ) AS list
      FROM
        UNNEST(
          [
            payload.histograms.a11y_consumers,
            payload.histograms.cert_validation_success_by_ca,
            payload.processes.content.histograms.cert_validation_success_by_ca,
            payload.histograms.checkerboard_severity,
            payload.processes.content.histograms.checkerboard_severity,
            JSON_EXTRACT(
              additional_properties,
              '$.payload.processes.gpu.histograms.CHECKERBOARD_SEVERITY'
            ),
            payload.histograms.composite_time,
            payload.processes.content.histograms.composite_time,
            JSON_EXTRACT(
              additional_properties,
              '$.payload.processes.gpu.histograms.COMPOSITE_TIME'
            ),
            JSON_EXTRACT(
              additional_properties,
              '$.payload.processes.gpu.histograms.CONTENT_FRAME_TIME'
            ),
            payload.histograms.content_paint_time,
            payload.processes.content.histograms.content_paint_time,
            payload.histograms.cookie_behavior,
            payload.histograms.cycle_collector_max_pause,
            payload.processes.content.histograms.cycle_collector_max_pause,
            payload.histograms.devtools_accessibility_picker_time_active_seconds,
            payload.processes.content.histograms.devtools_accessibility_picker_time_active_seconds,
            payload.histograms.devtools_accessibility_service_time_active_seconds,
            payload.processes.content.histograms.devtools_accessibility_service_time_active_seconds,
            payload.histograms.devtools_accessibility_time_active_seconds,
            payload.processes.content.histograms.devtools_accessibility_time_active_seconds,
            payload.histograms.devtools_fonteditor_n_fonts_rendered,
            payload.histograms.devtools_fonteditor_n_font_axes,
            payload.histograms.devtools_toolbox_time_active_seconds,
            payload.processes.content.histograms.devtools_toolbox_time_active_seconds,
            payload.histograms.dns_failed_lookup_time,
            payload.histograms.dns_lookup_time,
            payload.histograms.fx_new_window_ms,
            payload.histograms.fx_page_load_ms_2,
            payload.processes.content.histograms.fx_page_load_ms_2,
            payload.histograms.fx_session_restore_restore_window_ms,
            payload.histograms.fx_session_restore_startup_init_session_ms,
            payload.histograms.fx_session_restore_startup_onload_initial_window_ms,
            payload.histograms.fx_tab_close_time_anim_ms,
            payload.histograms.fx_tab_switch_total_e10s_ms,
            payload.histograms.fx_tab_switch_update_ms,
            payload.histograms.fx_urlbar_selected_result_index,
            payload.processes.content.histograms.fx_urlbar_selected_result_index,
            payload.histograms.fx_urlbar_selected_result_type,
            payload.processes.content.histograms.fx_urlbar_selected_result_type,
            payload.histograms.gc_animation_ms,
            payload.processes.content.histograms.gc_animation_ms,
            payload.histograms.gc_max_pause_ms_2,
            payload.processes.content.histograms.gc_max_pause_ms_2,
            payload.histograms.geolocation_request_granted,
            payload.processes.content.histograms.geolocation_request_granted,
            payload.histograms.ghost_windows,
            payload.processes.content.histograms.ghost_windows,
            payload.histograms.gpu_process_initialization_time_ms,
            payload.processes.content.histograms.gpu_process_initialization_time_ms,
            JSON_EXTRACT(
              additional_properties,
              '$.payload.processes.gpu.histograms.GPU_PROCESS_INITIALIZATION_TIME_MS'
            ),
            payload.histograms.gpu_process_launch_time_ms_2,
            payload.processes.content.histograms.gpu_process_launch_time_ms_2,
            payload.histograms.http_channel_disposition,
            payload.processes.content.histograms.http_channel_disposition,
            payload.histograms.http_pageload_is_ssl,
            payload.processes.content.histograms.http_pageload_is_ssl,
            payload.histograms.http_transaction_is_ssl,
            payload.processes.content.histograms.http_transaction_is_ssl,
            payload.histograms.input_event_response_coalesced_ms,
            payload.processes.content.histograms.input_event_response_coalesced_ms,
            payload.histograms.memory_heap_allocated,
            payload.processes.content.histograms.memory_heap_allocated,
            payload.histograms.memory_resident_fast,
            payload.processes.content.histograms.memory_resident_fast,
            payload.histograms.memory_total,
            payload.histograms.memory_unique,
            payload.processes.content.histograms.memory_unique,
            payload.processes.content.histograms.memory_unique_content_startup,
            payload.histograms.memory_vsize,
            payload.processes.content.histograms.memory_vsize,
            payload.histograms.memory_vsize_max_contiguous,
            payload.processes.content.histograms.memory_vsize_max_contiguous,
            payload.histograms.network_cache_metadata_first_read_time_ms,
            payload.processes.content.histograms.network_cache_metadata_first_read_time_ms,
            payload.histograms.network_cache_v2_hit_time_ms,
            payload.processes.content.histograms.network_cache_v2_hit_time_ms,
            payload.histograms.network_cache_v2_miss_time_ms,
            payload.processes.content.histograms.network_cache_v2_miss_time_ms,
            payload.histograms.places_autocomplete_6_first_results_time_ms,
            payload.histograms.plugin_shutdown_ms,
            payload.processes.content.histograms.plugin_shutdown_ms,
            payload.histograms.pwmgr_blocklist_num_sites,
            payload.histograms.pwmgr_form_autofill_result,
            payload.processes.content.histograms.pwmgr_form_autofill_result,
            payload.histograms.pwmgr_login_last_used_days,
            payload.histograms.pwmgr_login_page_safety,
            payload.processes.content.histograms.pwmgr_login_page_safety,
            payload.histograms.pwmgr_manage_opened,
            payload.histograms.pwmgr_manage_visibility_toggled,
            payload.histograms.pwmgr_num_passwords_per_hostname,
            payload.histograms.pwmgr_num_saved_passwords,
            payload.histograms.pwmgr_prompt_remember_action,
            payload.histograms.pwmgr_prompt_update_action,
            payload.histograms.pwmgr_saving_enabled,
            payload.histograms.search_service_init_ms,
            payload.histograms.ssl_handshake_result,
            payload.processes.content.histograms.ssl_handshake_result,
            payload.histograms.ssl_handshake_version,
            payload.processes.content.histograms.ssl_handshake_version,
            payload.histograms.ssl_tls12_intolerance_reason_pre,
            payload.processes.content.histograms.ssl_tls12_intolerance_reason_pre,
            payload.histograms.ssl_tls13_intolerance_reason_pre,
            payload.processes.content.histograms.ssl_tls13_intolerance_reason_pre,
            payload.processes.content.histograms.time_to_dom_complete_ms,
            payload.processes.content.histograms.time_to_dom_content_loaded_end_ms,
            payload.processes.content.histograms.time_to_dom_content_loaded_start_ms,
            payload.processes.content.histograms.time_to_dom_interactive_ms,
            payload.processes.content.histograms.time_to_dom_loading_ms,
            payload.histograms.time_to_first_click_ms,
            payload.processes.content.histograms.time_to_first_click_ms,
            payload.histograms.time_to_first_interaction_ms,
            payload.processes.content.histograms.time_to_first_interaction_ms,
            payload.histograms.time_to_first_key_input_ms,
            payload.processes.content.histograms.time_to_first_key_input_ms,
            payload.histograms.time_to_first_mouse_move_ms,
            payload.processes.content.histograms.time_to_first_mouse_move_ms,
            payload.histograms.time_to_first_scroll_ms,
            payload.processes.content.histograms.time_to_first_scroll_ms,
            payload.processes.content.histograms.time_to_load_event_end_ms,
            payload.processes.content.histograms.time_to_load_event_start_ms,
            payload.histograms.time_to_non_blank_paint_ms,
            payload.processes.content.histograms.time_to_non_blank_paint_ms,
            payload.histograms.time_to_response_start_ms,
            payload.processes.content.histograms.time_to_response_start_ms,
            payload.histograms.touch_enabled_device,
            payload.histograms.tracking_protection_enabled,
            payload.histograms.update_download_code_partial,
            payload.histograms.update_download_code_complete,
            payload.histograms.update_bits_result_partial,
            payload.histograms.update_bits_result_complete,
            payload.histograms.update_state_code_partial_stage,
            payload.histograms.update_state_code_complete_stage,
            payload.histograms.update_status_error_code_complete_stage,
            payload.histograms.update_status_error_code_partial_stage,
            payload.histograms.update_state_code_partial_startup,
            payload.histograms.update_state_code_complete_startup,
            payload.histograms.update_status_error_code_partial_startup,
            payload.histograms.update_status_error_code_complete_startup,
            payload.histograms.webext_background_page_load_ms,
            payload.histograms.webext_browseraction_popup_open_ms,
            payload.histograms.webext_content_script_injection_ms,
            payload.processes.content.histograms.webext_content_script_injection_ms,
            payload.histograms.webext_extension_startup_ms,
            payload.histograms.webext_pageaction_popup_open_ms,
            payload.histograms.webext_storage_local_get_ms,
            payload.processes.content.histograms.webext_storage_local_get_ms,
            payload.histograms.webext_storage_local_set_ms,
            payload.processes.content.histograms.webext_storage_local_set_ms,
            payload.histograms.webvr_time_spent_viewing_in_2d,
            payload.processes.content.histograms.webvr_time_spent_viewing_in_2d,
            payload.histograms.webvr_time_spent_viewing_in_oculus,
            JSON_EXTRACT(
              additional_properties,
              '$.payload.processes.gpu.histograms.WEBVR_TIME_SPENT_VIEWING_IN_OCULUS'
            ),
            payload.histograms.webvr_time_spent_viewing_in_openvr,
            JSON_EXTRACT(
              additional_properties,
              '$.payload.processes.gpu.histograms.WEBVR_TIME_SPENT_VIEWING_IN_OPENVR'
            ),
            payload.histograms.webvr_users_view_in,
            JSON_EXTRACT(
              additional_properties,
              '$.payload.processes.gpu.histograms.WEBVR_USERS_VIEW_IN'
            ),
            payload.processes.content.histograms.webvr_users_view_in,
            payload.histograms.a11y_instantiated_flag,
            payload.histograms.search_reset_result,
            payload.processes.content.histograms.search_reset_result,
            payload.histograms.gc_max_pause_ms,
            payload.processes.content.histograms.gc_max_pause_ms,
            payload.histograms.content_frame_time,
            payload.processes.content.histograms.tracking_protection_enabled,
            payload.processes.content.histograms.places_autocomplete_6_first_results_time_ms,
            payload.processes.content.histograms.memory_total,
            payload.processes.content.histograms.fx_session_restore_restore_window_ms,
            payload.processes.content.histograms.fx_session_restore_startup_init_session_ms,
            payload.processes.content.histograms.fx_session_restore_startup_onload_initial_window_ms,
            payload.processes.content.histograms.fx_tab_close_time_anim_ms,
            payload.processes.content.histograms.fx_tab_switch_update_ms,
            payload.processes.content.histograms.fx_new_window_ms,
            payload.processes.content.histograms.search_service_init_ms
          ]
        ) AS histogram
    ) AS values_histograms,
    ARRAY(
      SELECT AS STRUCT
        udf.null_if_empty_list(
          ARRAY(
            SELECT AS STRUCT
              key,
              udf.json_extract_int_map(JSON_EXTRACT(value, '$.values')) AS value
            FROM
              UNNEST(histogram)
          )
        ) AS list
      FROM
        UNNEST(
          [
            -- format:off
            STRUCT(payload.processes.content.keyed_histograms.fx_urlbar_selected_result_index_by_type AS histogram),
            STRUCT(payload.keyed_histograms.fx_urlbar_selected_result_index_by_type AS histogram),
            STRUCT(payload.processes.content.keyed_histograms.ipc_read_main_thread_latency_ms AS histogram),
            STRUCT(payload.processes.gpu.keyed_histograms.ipc_read_main_thread_latency_ms AS histogram),
            STRUCT(payload.keyed_histograms.ipc_read_main_thread_latency_ms AS histogram),
            STRUCT(payload.keyed_histograms.memory_distribution_among_content AS histogram),
            STRUCT(payload.processes.content.keyed_histograms.memory_distribution_among_content AS histogram)
            -- format:on
          ]
        )
    ) AS keyed_values_histograms,
    ARRAY(
      SELECT AS STRUCT
        SAFE_CAST(JSON_EXTRACT_SCALAR(histogram, '$.values.0') AS INT64) AS histogram
      FROM
        UNNEST(
          [
            payload.processes.content.histograms.devtools_aboutdebugging_opened_count,
            payload.processes.content.histograms.devtools_animationinspector_opened_count,
            payload.processes.content.histograms.devtools_browserconsole_opened_count,
            payload.processes.content.histograms.devtools_canvasdebugger_opened_count,
            payload.processes.content.histograms.devtools_computedview_opened_count,
            payload.processes.content.histograms.devtools_custom_opened_count,
            payload.processes.content.histograms.devtools_dom_opened_count,
            payload.processes.content.histograms.devtools_eyedropper_opened_count,
            payload.processes.content.histograms.devtools_fontinspector_opened_count,
            payload.processes.content.histograms.devtools_inspector_opened_count,
            payload.processes.content.histograms.devtools_jsbrowserdebugger_opened_count,
            payload.processes.content.histograms.devtools_jsdebugger_opened_count,
            payload.processes.content.histograms.devtools_jsprofiler_opened_count,
            payload.processes.content.histograms.devtools_layoutview_opened_count,
            payload.processes.content.histograms.devtools_memory_opened_count,
            payload.processes.content.histograms.devtools_menu_eyedropper_opened_count,
            payload.processes.content.histograms.devtools_netmonitor_opened_count,
            payload.processes.content.histograms.devtools_options_opened_count,
            payload.processes.content.histograms.devtools_paintflashing_opened_count,
            payload.processes.content.histograms.devtools_picker_eyedropper_opened_count,
            payload.processes.content.histograms.devtools_responsive_opened_count,
            payload.processes.content.histograms.devtools_ruleview_opened_count,
            payload.processes.content.histograms.devtools_scratchpad_opened_count,
            payload.processes.content.histograms.devtools_scratchpad_window_opened_count,
            payload.processes.content.histograms.devtools_shadereditor_opened_count,
            payload.processes.content.histograms.devtools_storage_opened_count,
            payload.processes.content.histograms.devtools_styleeditor_opened_count,
            payload.processes.content.histograms.devtools_webaudioeditor_opened_count,
            payload.processes.content.histograms.devtools_webconsole_opened_count,
            payload.processes.content.histograms.devtools_webide_opened_count,
            payload.processes.content.histograms.number_of_profiles,
            payload.processes.content.histograms.pwmgr_manage_copied_password,
            payload.processes.content.histograms.pwmgr_manage_copied_username,
            payload.processes.content.histograms.pwmgr_manage_deleted,
            payload.histograms.devtools_aboutdebugging_opened_count,
            payload.histograms.devtools_animationinspector_opened_count,
            payload.histograms.devtools_browserconsole_opened_count,
            payload.histograms.devtools_canvasdebugger_opened_count,
            payload.histograms.devtools_computedview_opened_count,
            payload.histograms.devtools_custom_opened_count,
            payload.histograms.devtools_dom_opened_count,
            payload.histograms.devtools_eyedropper_opened_count,
            payload.histograms.devtools_fontinspector_opened_count,
            payload.histograms.devtools_inspector_opened_count,
            payload.histograms.devtools_jsbrowserdebugger_opened_count,
            payload.histograms.devtools_jsdebugger_opened_count,
            payload.histograms.devtools_jsprofiler_opened_count,
            payload.histograms.devtools_layoutview_opened_count,
            payload.histograms.devtools_memory_opened_count,
            payload.histograms.devtools_menu_eyedropper_opened_count,
            payload.histograms.devtools_netmonitor_opened_count,
            payload.histograms.devtools_options_opened_count,
            payload.histograms.devtools_paintflashing_opened_count,
            payload.histograms.devtools_picker_eyedropper_opened_count,
            payload.histograms.devtools_responsive_opened_count,
            payload.histograms.devtools_ruleview_opened_count,
            payload.histograms.devtools_scratchpad_opened_count,
            payload.histograms.devtools_scratchpad_window_opened_count,
            payload.histograms.devtools_shadereditor_opened_count,
            payload.histograms.devtools_storage_opened_count,
            payload.histograms.devtools_styleeditor_opened_count,
            payload.histograms.devtools_webaudioeditor_opened_count,
            payload.histograms.devtools_webconsole_opened_count,
            payload.histograms.devtools_webide_opened_count,
            payload.histograms.number_of_profiles,
            payload.histograms.pwmgr_manage_copied_password,
            payload.histograms.pwmgr_manage_copied_username,
            payload.histograms.pwmgr_manage_deleted,
            payload.histograms.devtools_developertoolbar_opened_count,
            payload.processes.content.histograms.devtools_developertoolbar_opened_count
          ]
        ) AS histogram
    ) AS count_histograms,
    ARRAY(
      SELECT AS STRUCT
        udf.null_if_empty_list(
          ARRAY(
            SELECT AS STRUCT
              key,
              SAFE_CAST(JSON_EXTRACT_SCALAR(value, '$.values.0') AS INT64) AS value
            FROM
              UNNEST(histogram)
          )
        ) AS list
      FROM
        UNNEST(
          [
            -- format:off
            STRUCT(payload.processes.content.keyed_histograms.sandbox_rejected_syscalls AS histogram),
            STRUCT(payload.keyed_histograms.sandbox_rejected_syscalls AS histogram)
            -- format:on
          ]
        )
    ) AS keyed_count_histograms,
    ARRAY(
      SELECT AS STRUCT
        udf.null_if_empty_list(
          ARRAY(
            SELECT AS STRUCT
              IFNULL(labels[SAFE_OFFSET(key)], 'spill') AS key,
              value
            FROM
              UNNEST(udf.json_extract_int_map(JSON_EXTRACT(histogram, '$.values')))
          )
        ) AS list
      FROM
        UNNEST(
          [
            STRUCT(
              [
                payload.processes.content.histograms.fx_searchbar_selected_result_method,
                payload.histograms.fx_searchbar_selected_result_method
              ] AS histograms,
              ['enter', 'enterSelection', 'click'] AS labels
            ),
            (
              [
                payload.histograms.devtools_about_devtools_opened_key,
                payload.histograms.devtools_about_devtools_opened_reason
              ],
              []
            ),
            (
              [payload.histograms.devtools_entry_point],
              [
                'KeyShortcut',
                'SystemMenu',
                'HamburgerMenu',
                'ContextMenu',
                'CommandLine',
                'SessionRestore'
              ]
            ),
            (
              [payload.histograms.devtools_fonteditor_font_type_displayed],
              ['variable', 'nonvariable']
            ),
            (
              [
                payload.processes.content.histograms.fx_urlbar_selected_result_method,
                payload.histograms.fx_urlbar_selected_result_method
              ],
              [
                'enter',
                'enterSelection',
                'click',
                'arrowEnterSelection',
                'tabEnterSelection',
                'rightClickEnter'
              ]
            ),
            (
              [payload.histograms.update_can_use_bits_notify],
              [
                'CanUseBits',
                'NoBits_NotWindows',
                'NoBits_FeatureOff',
                'NoBits_Pref',
                'NoBits_Proxy',
                'NoBits_OtherUser'
              ]
            ),
            (
              [payload.histograms.webext_browseraction_popup_preload_result_count],
              ['popupShown', 'clearAfterHover', 'clearAfterMousedown']
            )
          ]
        ),
        UNNEST(histograms) AS histogram
    ) AS categorical_histograms,
    ARRAY(
      SELECT AS STRUCT
        udf.null_if_empty_list(
          ARRAY(
            SELECT AS STRUCT
              key,
              ARRAY(
                SELECT AS STRUCT
                  IFNULL(labels[SAFE_OFFSET(_.key)], 'spill') AS key,
                  _.value
                FROM
                  UNNEST(udf.json_extract_int_map(JSON_EXTRACT(value, '$.values'))) AS _
              ) AS value
            FROM
              UNNEST(histogram)
          )
        ) AS list
      FROM
        UNNEST(
          [
            STRUCT(
              [
                -- format:off
                STRUCT(payload.processes.content.keyed_histograms.uptake_remote_content_result_1 AS histogram),
                STRUCT(payload.processes.gpu.keyed_histograms.uptake_remote_content_result_1 AS histogram),
                STRUCT(payload.keyed_histograms.uptake_remote_content_result_1 AS histogram)
                -- format:on
              ] AS histograms,
              [
                'up_to_date',
                'success',
                'backoff',
                'pref_disabled',
                'parse_error',
                'content_error',
                'sign_error',
                'sign_retry_error',
                'conflict_error',
                'sync_error',
                'apply_error',
                'server_error',
                'certificate_error',
                'download_error',
                'timeout_error',
                'network_error',
                'offline_error',
                'cleanup_error',
                'unknown_error',
                'custom_1_error',
                'custom_2_error',
                'custom_3_error',
                'custom_4_error',
                'custom_5_error'
              ] AS labels
            )
          ]
        ),
        UNNEST(histograms)
    ) AS keyed_categorical_histograms
  FROM
    `moz-fx-data-shared-prod.telemetry.main`
  WHERE
    DATE(submission_timestamp) = @submission_date
    AND normalized_app_name = 'Firefox'
    AND document_id IS NOT NULL
)
SELECT
  * EXCEPT (
    values_histograms,
    keyed_values_histograms,
    count_histograms,
    keyed_count_histograms,
    categorical_histograms,
    keyed_categorical_histograms
  ),
  -- format:off
  values_histograms[OFFSET(0)] AS histogram_parent_a11y_consumers,
  values_histograms[OFFSET(1)] AS histogram_parent_cert_validation_success_by_ca,
  values_histograms[OFFSET(2)] AS histogram_content_cert_validation_success_by_ca,
  values_histograms[OFFSET(3)] AS histogram_parent_checkerboard_severity,
  values_histograms[OFFSET(4)] AS histogram_content_checkerboard_severity,
  values_histograms[OFFSET(5)] AS histogram_gpu_checkerboard_severity,
  values_histograms[OFFSET(6)] AS histogram_parent_composite_time,
  values_histograms[OFFSET(7)] AS histogram_content_composite_time,
  values_histograms[OFFSET(8)] AS histogram_gpu_composite_time,
  values_histograms[OFFSET(9)] AS histogram_gpu_content_frame_time,
  values_histograms[OFFSET(10)] AS histogram_parent_content_paint_time,
  values_histograms[OFFSET(11)] AS histogram_content_content_paint_time,
  values_histograms[OFFSET(12)] AS histogram_parent_cookie_behavior,
  values_histograms[OFFSET(13)] AS histogram_parent_cycle_collector_max_pause,
  values_histograms[OFFSET(14)] AS histogram_content_cycle_collector_max_pause,
  values_histograms[OFFSET(15)] AS histogram_parent_devtools_accessibility_picker_time_active_seconds,
  values_histograms[OFFSET(16)] AS histogram_content_devtools_accessibility_picker_time_active_seconds,
  values_histograms[OFFSET(17)] AS histogram_parent_devtools_accessibility_service_time_active_seconds,
  values_histograms[OFFSET(18)] AS histogram_content_devtools_accessibility_service_time_active_seconds,
  values_histograms[OFFSET(19)] AS histogram_parent_devtools_accessibility_time_active_seconds,
  values_histograms[OFFSET(10)] AS histogram_content_devtools_accessibility_time_active_seconds,
  values_histograms[OFFSET(21)] AS histogram_parent_devtools_fonteditor_n_fonts_rendered,
  values_histograms[OFFSET(22)] AS histogram_parent_devtools_fonteditor_n_font_axes,
  values_histograms[OFFSET(23)] AS histogram_parent_devtools_toolbox_time_active_seconds,
  values_histograms[OFFSET(24)] AS histogram_content_devtools_toolbox_time_active_seconds,
  values_histograms[OFFSET(25)] AS histogram_parent_dns_failed_lookup_time,
  values_histograms[OFFSET(26)] AS histogram_parent_dns_lookup_time,
  values_histograms[OFFSET(27)] AS histogram_parent_fx_new_window_ms,
  values_histograms[OFFSET(28)] AS histogram_parent_fx_page_load_ms_2,
  values_histograms[OFFSET(29)] AS histogram_content_fx_page_load_ms_2,
  values_histograms[OFFSET(30)] AS histogram_parent_fx_session_restore_restore_window_ms,
  values_histograms[OFFSET(31)] AS histogram_parent_fx_session_restore_startup_init_session_ms,
  values_histograms[OFFSET(32)] AS histogram_parent_fx_session_restore_startup_onload_initial_window_ms,
  values_histograms[OFFSET(33)] AS histogram_parent_fx_tab_close_time_anim_ms,
  values_histograms[OFFSET(34)] AS histogram_parent_fx_tab_switch_total_e10s_ms,
  values_histograms[OFFSET(35)] AS histogram_parent_fx_tab_switch_update_ms,
  values_histograms[OFFSET(36)] AS histogram_parent_fx_urlbar_selected_result_index,
  values_histograms[OFFSET(37)] AS histogram_content_fx_urlbar_selected_result_index,
  values_histograms[OFFSET(38)] AS histogram_parent_fx_urlbar_selected_result_type,
  values_histograms[OFFSET(39)] AS histogram_content_fx_urlbar_selected_result_type,
  values_histograms[OFFSET(40)] AS histogram_parent_gc_animation_ms,
  values_histograms[OFFSET(41)] AS histogram_content_gc_animation_ms,
  values_histograms[OFFSET(42)] AS histogram_parent_gc_max_pause_ms_2,
  values_histograms[OFFSET(43)] AS histogram_content_gc_max_pause_ms_2,
  values_histograms[OFFSET(44)] AS histogram_parent_geolocation_request_granted,
  values_histograms[OFFSET(45)] AS histogram_content_geolocation_request_granted,
  values_histograms[OFFSET(46)] AS histogram_parent_ghost_windows,
  values_histograms[OFFSET(47)] AS histogram_content_ghost_windows,
  values_histograms[OFFSET(48)] AS histogram_parent_gpu_process_initialization_time_ms,
  values_histograms[OFFSET(49)] AS histogram_content_gpu_process_initialization_time_ms,
  values_histograms[OFFSET(50)] AS histogram_gpu_gpu_process_initialization_time_ms,
  values_histograms[OFFSET(51)] AS histogram_parent_gpu_process_launch_time_ms_2,
  values_histograms[OFFSET(52)] AS histogram_content_gpu_process_launch_time_ms_2,
  values_histograms[OFFSET(53)] AS histogram_parent_http_channel_disposition,
  values_histograms[OFFSET(54)] AS histogram_content_http_channel_disposition,
  values_histograms[OFFSET(55)] AS histogram_parent_http_pageload_is_ssl,
  values_histograms[OFFSET(56)] AS histogram_content_http_pageload_is_ssl,
  values_histograms[OFFSET(57)] AS histogram_parent_http_transaction_is_ssl,
  values_histograms[OFFSET(58)] AS histogram_content_http_transaction_is_ssl,
  values_histograms[OFFSET(59)] AS histogram_parent_input_event_response_coalesced_ms,
  values_histograms[OFFSET(60)] AS histogram_content_input_event_response_coalesced_ms,
  values_histograms[OFFSET(61)] AS histogram_parent_memory_heap_allocated,
  values_histograms[OFFSET(62)] AS histogram_content_memory_heap_allocated,
  values_histograms[OFFSET(63)] AS histogram_parent_memory_resident_fast,
  values_histograms[OFFSET(64)] AS histogram_content_memory_resident_fast,
  values_histograms[OFFSET(65)] AS histogram_parent_memory_total,
  values_histograms[OFFSET(66)] AS histogram_parent_memory_unique,
  values_histograms[OFFSET(67)] AS histogram_content_memory_unique,
  values_histograms[OFFSET(68)] AS histogram_content_memory_unique_content_startup,
  values_histograms[OFFSET(69)] AS histogram_parent_memory_vsize,
  values_histograms[OFFSET(70)] AS histogram_content_memory_vsize,
  values_histograms[OFFSET(71)] AS histogram_parent_memory_vsize_max_contiguous,
  values_histograms[OFFSET(72)] AS histogram_content_memory_vsize_max_contiguous,
  values_histograms[OFFSET(73)] AS histogram_parent_network_cache_metadata_first_read_time_ms,
  values_histograms[OFFSET(74)] AS histogram_content_network_cache_metadata_first_read_time_ms,
  values_histograms[OFFSET(75)] AS histogram_parent_network_cache_v2_hit_time_ms,
  values_histograms[OFFSET(76)] AS histogram_content_network_cache_v2_hit_time_ms,
  values_histograms[OFFSET(77)] AS histogram_parent_network_cache_v2_miss_time_ms,
  values_histograms[OFFSET(78)] AS histogram_content_network_cache_v2_miss_time_ms,
  values_histograms[OFFSET(79)] AS histogram_parent_places_autocomplete_6_first_results_time_ms,
  values_histograms[OFFSET(80)] AS histogram_parent_plugin_shutdown_ms,
  values_histograms[OFFSET(81)] AS histogram_content_plugin_shutdown_ms,
  values_histograms[OFFSET(82)] AS histogram_parent_pwmgr_blocklist_num_sites,
  values_histograms[OFFSET(83)] AS histogram_parent_pwmgr_form_autofill_result,
  values_histograms[OFFSET(84)] AS histogram_content_pwmgr_form_autofill_result,
  values_histograms[OFFSET(85)] AS histogram_parent_pwmgr_login_last_used_days,
  values_histograms[OFFSET(86)] AS histogram_parent_pwmgr_login_page_safety,
  values_histograms[OFFSET(87)] AS histogram_content_pwmgr_login_page_safety,
  values_histograms[OFFSET(88)] AS histogram_parent_pwmgr_manage_opened,
  values_histograms[OFFSET(89)] AS histogram_parent_pwmgr_manage_visibility_toggled,
  values_histograms[OFFSET(90)] AS histogram_parent_pwmgr_num_passwords_per_hostname,
  values_histograms[OFFSET(91)] AS histogram_parent_pwmgr_num_saved_passwords,
  values_histograms[OFFSET(92)] AS histogram_parent_pwmgr_prompt_remember_action,
  values_histograms[OFFSET(93)] AS histogram_parent_pwmgr_prompt_update_action,
  values_histograms[OFFSET(94)] AS histogram_parent_pwmgr_saving_enabled,
  values_histograms[OFFSET(95)] AS histogram_parent_search_service_init_ms,
  values_histograms[OFFSET(96)] AS histogram_parent_ssl_handshake_result,
  values_histograms[OFFSET(97)] AS histogram_content_ssl_handshake_result,
  values_histograms[OFFSET(98)] AS histogram_parent_ssl_handshake_version,
  values_histograms[OFFSET(99)] AS histogram_content_ssl_handshake_version,
  values_histograms[OFFSET(100)] AS histogram_parent_ssl_tls12_intolerance_reason_pre,
  values_histograms[OFFSET(101)] AS histogram_content_ssl_tls12_intolerance_reason_pre,
  values_histograms[OFFSET(102)] AS histogram_parent_ssl_tls13_intolerance_reason_pre,
  values_histograms[OFFSET(103)] AS histogram_content_ssl_tls13_intolerance_reason_pre,
  values_histograms[OFFSET(104)] AS histogram_content_time_to_dom_complete_ms,
  values_histograms[OFFSET(105)] AS histogram_content_time_to_dom_content_loaded_end_ms,
  values_histograms[OFFSET(106)] AS histogram_content_time_to_dom_content_loaded_start_ms,
  values_histograms[OFFSET(107)] AS histogram_content_time_to_dom_interactive_ms,
  values_histograms[OFFSET(108)] AS histogram_content_time_to_dom_loading_ms,
  values_histograms[OFFSET(109)] AS histogram_parent_time_to_first_click_ms,
  values_histograms[OFFSET(110)] AS histogram_content_time_to_first_click_ms,
  values_histograms[OFFSET(111)] AS histogram_parent_time_to_first_interaction_ms,
  values_histograms[OFFSET(112)] AS histogram_content_time_to_first_interaction_ms,
  values_histograms[OFFSET(113)] AS histogram_parent_time_to_first_key_input_ms,
  values_histograms[OFFSET(114)] AS histogram_content_time_to_first_key_input_ms,
  values_histograms[OFFSET(115)] AS histogram_parent_time_to_first_mouse_move_ms,
  values_histograms[OFFSET(116)] AS histogram_content_time_to_first_mouse_move_ms,
  values_histograms[OFFSET(117)] AS histogram_parent_time_to_first_scroll_ms,
  values_histograms[OFFSET(118)] AS histogram_content_time_to_first_scroll_ms,
  values_histograms[OFFSET(119)] AS histogram_content_time_to_load_event_end_ms,
  values_histograms[OFFSET(120)] AS histogram_content_time_to_load_event_start_ms,
  values_histograms[OFFSET(121)] AS histogram_parent_time_to_non_blank_paint_ms,
  values_histograms[OFFSET(122)] AS histogram_content_time_to_non_blank_paint_ms,
  values_histograms[OFFSET(123)] AS histogram_parent_time_to_response_start_ms,
  values_histograms[OFFSET(124)] AS histogram_content_time_to_response_start_ms,
  values_histograms[OFFSET(125)] AS histogram_parent_touch_enabled_device,
  values_histograms[OFFSET(126)] AS histogram_parent_tracking_protection_enabled,
  values_histograms[OFFSET(127)] AS histogram_parent_update_download_code_partial,
  values_histograms[OFFSET(128)] AS histogram_parent_update_download_code_complete,
  values_histograms[OFFSET(129)] AS histogram_parent_update_bits_result_partial,
  values_histograms[OFFSET(130)] AS histogram_parent_update_bits_result_complete,
  values_histograms[OFFSET(131)] AS histogram_parent_update_state_code_partial_stage,
  values_histograms[OFFSET(132)] AS histogram_parent_update_state_code_complete_stage,
  values_histograms[OFFSET(133)] AS histogram_parent_update_status_error_code_complete_stage,
  values_histograms[OFFSET(134)] AS histogram_parent_update_status_error_code_partial_stage,
  values_histograms[OFFSET(135)] AS histogram_parent_update_state_code_partial_startup,
  values_histograms[OFFSET(136)] AS histogram_parent_update_state_code_complete_startup,
  values_histograms[OFFSET(137)] AS histogram_parent_update_status_error_code_partial_startup,
  values_histograms[OFFSET(138)] AS histogram_parent_update_status_error_code_complete_startup,
  values_histograms[OFFSET(139)] AS histogram_parent_webext_background_page_load_ms,
  values_histograms[OFFSET(140)] AS histogram_parent_webext_browseraction_popup_open_ms,
  values_histograms[OFFSET(141)] AS histogram_parent_webext_content_script_injection_ms,
  values_histograms[OFFSET(142)] AS histogram_content_webext_content_script_injection_ms,
  values_histograms[OFFSET(143)] AS histogram_parent_webext_extension_startup_ms,
  values_histograms[OFFSET(144)] AS histogram_parent_webext_pageaction_popup_open_ms,
  values_histograms[OFFSET(145)] AS histogram_parent_webext_storage_local_get_ms,
  values_histograms[OFFSET(146)] AS histogram_content_webext_storage_local_get_ms,
  values_histograms[OFFSET(147)] AS histogram_parent_webext_storage_local_set_ms,
  values_histograms[OFFSET(148)] AS histogram_content_webext_storage_local_set_ms,
  values_histograms[OFFSET(149)] AS histogram_parent_webvr_time_spent_viewing_in_2d,
  values_histograms[OFFSET(150)] AS histogram_content_webvr_time_spent_viewing_in_2d,
  values_histograms[OFFSET(151)] AS histogram_parent_webvr_time_spent_viewing_in_oculus,
  values_histograms[OFFSET(152)] AS histogram_gpu_webvr_time_spent_viewing_in_oculus,
  values_histograms[OFFSET(153)] AS histogram_parent_webvr_time_spent_viewing_in_openvr,
  values_histograms[OFFSET(154)] AS histogram_gpu_webvr_time_spent_viewing_in_openvr,
  values_histograms[OFFSET(155)] AS histogram_parent_webvr_users_view_in,
  values_histograms[OFFSET(156)] AS histogram_gpu_webvr_users_view_in,
  values_histograms[OFFSET(157)] AS histogram_content_webvr_users_view_in,
  values_histograms[OFFSET(158)] AS histogram_parent_a11y_instantiated_flag,
  values_histograms[OFFSET(159)] AS histogram_parent_search_reset_result,
  values_histograms[OFFSET(160)] AS histogram_content_search_reset_result,
  values_histograms[OFFSET(161)] AS histogram_parent_gc_max_pause_ms,
  values_histograms[OFFSET(162)] AS histogram_content_gc_max_pause_ms,
  values_histograms[OFFSET(163)] AS histogram_parent_content_frame_time,
  values_histograms[OFFSET(164)] AS histogram_content_tracking_protection_enabled,
  values_histograms[OFFSET(165)] AS histogram_content_places_autocomplete_6_first_results_time_ms,
  values_histograms[OFFSET(166)] AS histogram_content_memory_total,
  values_histograms[OFFSET(167)] AS histogram_content_fx_session_restore_restore_window_ms,
  values_histograms[OFFSET(168)] AS histogram_content_fx_session_restore_startup_init_session_ms,
  values_histograms[OFFSET(169)] AS histogram_content_fx_session_restore_startup_onload_initial_window_ms,
  values_histograms[OFFSET(170)] AS histogram_content_fx_tab_close_time_anim_ms,
  values_histograms[OFFSET(171)] AS histogram_content_fx_tab_switch_update_ms,
  values_histograms[OFFSET(172)] AS histogram_content_fx_new_window_ms,
  values_histograms[OFFSET(173)] AS histogram_content_search_service_init_ms,
  keyed_values_histograms[OFFSET(0)] AS histogram_content_fx_urlbar_selected_result_index_by_type,
  keyed_values_histograms[OFFSET(1)] AS histogram_parent_fx_urlbar_selected_result_index_by_type,
  keyed_values_histograms[OFFSET(2)] AS histogram_content_ipc_read_main_thread_latency_ms,
  keyed_values_histograms[OFFSET(3)] AS histogram_gpu_ipc_read_main_thread_latency_ms,
  keyed_values_histograms[OFFSET(4)] AS histogram_parent_ipc_read_main_thread_latency_ms,
  keyed_values_histograms[OFFSET(5)] AS histogram_parent_memory_distribution_among_content,
  keyed_values_histograms[OFFSET(6)] AS histogram_content_memory_distribution_among_content,
  count_histograms[OFFSET( 0)].histogram AS histogram_content_devtools_aboutdebugging_opened_count,
  count_histograms[OFFSET( 1)].histogram AS histogram_content_devtools_animationinspector_opened_count,
  count_histograms[OFFSET( 2)].histogram AS histogram_content_devtools_browserconsole_opened_count,
  count_histograms[OFFSET( 3)].histogram AS histogram_content_devtools_canvasdebugger_opened_count,
  count_histograms[OFFSET( 4)].histogram AS histogram_content_devtools_computedview_opened_count,
  count_histograms[OFFSET( 5)].histogram AS histogram_content_devtools_custom_opened_count,
  count_histograms[OFFSET( 6)].histogram AS histogram_content_devtools_dom_opened_count,
  count_histograms[OFFSET( 7)].histogram AS histogram_content_devtools_eyedropper_opened_count,
  count_histograms[OFFSET( 8)].histogram AS histogram_content_devtools_fontinspector_opened_count,
  count_histograms[OFFSET( 9)].histogram AS histogram_content_devtools_inspector_opened_count,
  count_histograms[OFFSET(10)].histogram AS histogram_content_devtools_jsbrowserdebugger_opened_count,
  count_histograms[OFFSET(11)].histogram AS histogram_content_devtools_jsdebugger_opened_count,
  count_histograms[OFFSET(12)].histogram AS histogram_content_devtools_jsprofiler_opened_count,
  count_histograms[OFFSET(13)].histogram AS histogram_content_devtools_layoutview_opened_count,
  count_histograms[OFFSET(14)].histogram AS histogram_content_devtools_memory_opened_count,
  count_histograms[OFFSET(15)].histogram AS histogram_content_devtools_menu_eyedropper_opened_count,
  count_histograms[OFFSET(16)].histogram AS histogram_content_devtools_netmonitor_opened_count,
  count_histograms[OFFSET(17)].histogram AS histogram_content_devtools_options_opened_count,
  count_histograms[OFFSET(18)].histogram AS histogram_content_devtools_paintflashing_opened_count,
  count_histograms[OFFSET(19)].histogram AS histogram_content_devtools_picker_eyedropper_opened_count,
  count_histograms[OFFSET(20)].histogram AS histogram_content_devtools_responsive_opened_count,
  count_histograms[OFFSET(21)].histogram AS histogram_content_devtools_ruleview_opened_count,
  count_histograms[OFFSET(22)].histogram AS histogram_content_devtools_scratchpad_opened_count,
  count_histograms[OFFSET(23)].histogram AS histogram_content_devtools_scratchpad_window_opened_count,
  count_histograms[OFFSET(24)].histogram AS histogram_content_devtools_shadereditor_opened_count,
  count_histograms[OFFSET(25)].histogram AS histogram_content_devtools_storage_opened_count,
  count_histograms[OFFSET(26)].histogram AS histogram_content_devtools_styleeditor_opened_count,
  count_histograms[OFFSET(27)].histogram AS histogram_content_devtools_webaudioeditor_opened_count,
  count_histograms[OFFSET(28)].histogram AS histogram_content_devtools_webconsole_opened_count,
  count_histograms[OFFSET(29)].histogram AS histogram_content_devtools_webide_opened_count,
  count_histograms[OFFSET(30)].histogram AS histogram_content_number_of_profiles,
  count_histograms[OFFSET(31)].histogram AS histogram_content_pwmgr_manage_copied_password,
  count_histograms[OFFSET(32)].histogram AS histogram_content_pwmgr_manage_copied_username,
  count_histograms[OFFSET(33)].histogram AS histogram_content_pwmgr_manage_deleted,
  count_histograms[OFFSET(34)].histogram AS histogram_parent_devtools_aboutdebugging_opened_count,
  count_histograms[OFFSET(35)].histogram AS histogram_parent_devtools_animationinspector_opened_count,
  count_histograms[OFFSET(36)].histogram AS histogram_parent_devtools_browserconsole_opened_count,
  count_histograms[OFFSET(37)].histogram AS histogram_parent_devtools_canvasdebugger_opened_count,
  count_histograms[OFFSET(38)].histogram AS histogram_parent_devtools_computedview_opened_count,
  count_histograms[OFFSET(39)].histogram AS histogram_parent_devtools_custom_opened_count,
  count_histograms[OFFSET(40)].histogram AS histogram_parent_devtools_dom_opened_count,
  count_histograms[OFFSET(41)].histogram AS histogram_parent_devtools_eyedropper_opened_count,
  count_histograms[OFFSET(42)].histogram AS histogram_parent_devtools_fontinspector_opened_count,
  count_histograms[OFFSET(43)].histogram AS histogram_parent_devtools_inspector_opened_count,
  count_histograms[OFFSET(44)].histogram AS histogram_parent_devtools_jsbrowserdebugger_opened_count,
  count_histograms[OFFSET(45)].histogram AS histogram_parent_devtools_jsdebugger_opened_count,
  count_histograms[OFFSET(46)].histogram AS histogram_parent_devtools_jsprofiler_opened_count,
  count_histograms[OFFSET(47)].histogram AS histogram_parent_devtools_layoutview_opened_count,
  count_histograms[OFFSET(48)].histogram AS histogram_parent_devtools_memory_opened_count,
  count_histograms[OFFSET(49)].histogram AS histogram_parent_devtools_menu_eyedropper_opened_count,
  count_histograms[OFFSET(50)].histogram AS histogram_parent_devtools_netmonitor_opened_count,
  count_histograms[OFFSET(51)].histogram AS histogram_parent_devtools_options_opened_count,
  count_histograms[OFFSET(52)].histogram AS histogram_parent_devtools_paintflashing_opened_count,
  count_histograms[OFFSET(53)].histogram AS histogram_parent_devtools_picker_eyedropper_opened_count,
  count_histograms[OFFSET(54)].histogram AS histogram_parent_devtools_responsive_opened_count,
  count_histograms[OFFSET(55)].histogram AS histogram_parent_devtools_ruleview_opened_count,
  count_histograms[OFFSET(56)].histogram AS histogram_parent_devtools_scratchpad_opened_count,
  count_histograms[OFFSET(57)].histogram AS histogram_parent_devtools_scratchpad_window_opened_count,
  count_histograms[OFFSET(58)].histogram AS histogram_parent_devtools_shadereditor_opened_count,
  count_histograms[OFFSET(59)].histogram AS histogram_parent_devtools_storage_opened_count,
  count_histograms[OFFSET(60)].histogram AS histogram_parent_devtools_styleeditor_opened_count,
  count_histograms[OFFSET(61)].histogram AS histogram_parent_devtools_webaudioeditor_opened_count,
  count_histograms[OFFSET(62)].histogram AS histogram_parent_devtools_webconsole_opened_count,
  count_histograms[OFFSET(63)].histogram AS histogram_parent_devtools_webide_opened_count,
  count_histograms[OFFSET(64)].histogram AS histogram_parent_number_of_profiles,
  count_histograms[OFFSET(65)].histogram AS histogram_parent_pwmgr_manage_copied_password,
  count_histograms[OFFSET(66)].histogram AS histogram_parent_pwmgr_manage_copied_username,
  count_histograms[OFFSET(67)].histogram AS histogram_parent_pwmgr_manage_deleted,
  count_histograms[OFFSET(68)].histogram AS histogram_parent_devtools_developertoolbar_opened_count,
  count_histograms[OFFSET(69)].histogram AS histogram_content_devtools_developertoolbar_opened_count,
  keyed_count_histograms[OFFSET(0)] AS histogram_content_sandbox_rejected_syscalls,
  keyed_count_histograms[OFFSET(1)] AS histogram_parent_sandbox_rejected_syscalls,
  categorical_histograms[OFFSET(0)] AS histogram_content_fx_searchbar_selected_result_method,
  categorical_histograms[OFFSET(1)] AS histogram_parent_fx_searchbar_selected_result_method,
  categorical_histograms[OFFSET(2)] AS histogram_parent_devtools_about_devtools_opened_key,
  categorical_histograms[OFFSET(3)] AS histogram_parent_devtools_about_devtools_opened_reason,
  categorical_histograms[OFFSET(4)] AS histogram_parent_devtools_entry_point,
  categorical_histograms[OFFSET(5)] AS histogram_parent_devtools_fonteditor_font_type_displayed,
  categorical_histograms[OFFSET(6)] AS histogram_content_fx_urlbar_selected_result_method,
  categorical_histograms[OFFSET(7)] AS histogram_parent_fx_urlbar_selected_result_method,
  categorical_histograms[OFFSET(8)] AS histogram_parent_update_can_use_bits_notify,
  categorical_histograms[OFFSET(9)] AS histogram_parent_webext_browseraction_popup_preload_result_count,
  keyed_categorical_histograms[OFFSET(0)] AS histogram_content_uptake_remote_content_result_1,
  keyed_categorical_histograms[OFFSET(1)] AS histogram_gpu_uptake_remote_content_result_1,
  keyed_categorical_histograms[OFFSET(2)] AS histogram_parent_uptake_remote_content_result_1
  -- format:on
FROM
  histogram_lists
