prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.6'
,p_default_workspace_id=>1000001
,p_default_application_id=>134
,p_default_id_offset=>0
,p_default_owner=>'WKSP_ASSENTADEV'
);
end;
/
 
prompt APPLICATION 134 - Dashboard with Chart and Cards
--
-- Application Export:
--   Application:     134
--   Name:            Dashboard with Chart and Cards
--   Date and Time:   04:39 Friday July 11, 2025
--   Exported By:     MISHAB
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 78870330209392195
--   Manifest End
--   Version:         24.2.6
--   Instance ID:     7828741953581541
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/template_component/dashboard_with_chart_and_cards
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(78870330209392195)
,p_plugin_type=>'TEMPLATE COMPONENT'
,p_theme_id=>nvl(wwv_flow_application_install.get_theme_id, '')
,p_name=>'DASHBOARD_WITH_CHART_AND_CARDS'
,p_display_name=>'Dashboard with Chart and Cards'
,p_supported_component_types=>'PARTIAL:REPORT'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>',
'#APP_FILES#script#MIN#.js',
'#APP_FILES#script.js'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#style.css',
'#APP_FILES#style#MIN#.css',
'<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet" />'))
,p_partial_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{if APEX$IS_LAZY_LOADING/}',
'  <div class="progress-card loading">Loading...</div>',
'{else/}',
'    ',
'  <div class="progress-card" data-progress="#VALUE#">',
'    <img src="#IMAGE#" class="avatar" />',
'    <div class="info">',
'      <h4>#TITLE#</h4>',
'      <p>#SUBTITLE#</p>',
'      <div class="progress-bar" data-progress="#VALUE#">',
'        <div class="progress-fill" style="width:#VALUE#%;max-width:100%;" data-value="#VALUE#">#VALUE#</div>',
'      </div>',
'    </div>',
'  </div>',
'  <div id="chart-config"',
'        data-minimum-value="#MINIMUM_VALUE#"',
'        data-maximum-range="#MAXIMUM_RANGE#"',
'        data-step-number="#STEP_NUMBER#"',
'        data-value-type="#VALUE_TYPE#"',
'        data-value="#VALUE#"',
'        data-header="#HEADER_NAME#"',
'        data-region-title="#REGION_TITLE#"',
'        data-region-subtitle="#REGION_SUBTITLE#">',
'    </div>',
'{endif/}'))
,p_default_escape_mode=>'HTML'
,p_translate_this_template=>false
,p_api_version=>1
,p_report_body_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="progress-container">',
'  <h4 id="region-subtitle">Progress Report</h4>',
'  #APEX$ROWS#',
'</div>'))
,p_report_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div  #APEX$ROW_IDENTIFICATION#>',
'  #APEX$PARTIAL#',
'</div> ',
''))
,p_report_container_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{if APEX$IS_LAZY_LOADING/}',
'  <div class="dashboard-wrapper lazy-loading">',
'    <p>Loading Dashboard...</p>',
'  </div>',
'{else/} ',
'    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet" />',
'    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>',
'    <div class="col-4">',
'        <div class="dashboard-wrapper" id="dashboardCard">',
'                <div class="dashboard-header">',
unistr('                <!-- <span id="header-title">\D83D\DCCA HEADER_TITLE</span> -->'),
unistr('                <span>\D83D\DCCA <span id="header-title">HEADER_TITLE</span></span>'),
'                <div>',
unistr('                    <button type="button" class="toggle-btn" onclick="toggleCardDarkMode()">\D83C\DF13</button>'),
unistr('                    <button type="button" class="toggle-btn" onclick="toggleChartType()">\D83D\DCC8 Toggle Chart</button>'),
'                </div>',
'                </div>',
'                <div class="dashboard-content">',
'                <!-- Chart -->',
'                <div class="chart-container">',
'                    <h3 id="region-title">REGION_TITLE</h3>',
'                    <canvas id="lineChart"></canvas>',
'                </div>',
'                </div>',
'                <div>',
'                    <div class="progress-container">',
'                        #APEX$REPORT_BODY#',
'                    </div>',
'                </div>',
'                <div>',
'                    <div class="progress-card" data-progress="#VALUE#">',
'                    </div>',
'                </div>',
'        </div>',
'    </div>',
'{endif/}',
'',
'<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>',
''))
,p_report_placeholder_count=>3
,p_standard_attributes=>'ROW_SELECTION:REGION_TEMPLATE'
,p_substitute_attributes=>true
,p_version_scn=>39535576505396
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(78887977627478084)
,p_plugin_id=>wwv_flow_imp.id(78870330209392195)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_static_id=>'TITLE'
,p_prompt=>'Title'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(78888516554478726)
,p_plugin_id=>wwv_flow_imp.id(78870330209392195)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_static_id=>'SUBTITLE'
,p_prompt=>'Subtitle'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(78911180567635980)
,p_plugin_id=>wwv_flow_imp.id(78870330209392195)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_static_id=>'IMAGE'
,p_prompt=>'Image'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(78917971821921781)
,p_plugin_id=>wwv_flow_imp.id(78870330209392195)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_static_id=>'VALUE_TYPE'
,p_prompt=>'Value Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_common=>false
,p_default_value=>'PERCENT'
,p_escape_mode=>'HTML'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(78918524090922823)
,p_plugin_attribute_id=>wwv_flow_imp.id(78917971821921781)
,p_display_sequence=>10
,p_display_value=>'PERCENT'
,p_return_value=>'PERCENT'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(78918988774923725)
,p_plugin_attribute_id=>wwv_flow_imp.id(78917971821921781)
,p_display_sequence=>20
,p_display_value=>'DECIMAL'
,p_return_value=>'DECIMAL'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(78919319682924688)
,p_plugin_attribute_id=>wwv_flow_imp.id(78917971821921781)
,p_display_sequence=>30
,p_display_value=>'NUMBER'
,p_return_value=>'NUMBER'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(78920345281928524)
,p_plugin_id=>wwv_flow_imp.id(78870330209392195)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_static_id=>'MINIMUM_VALUE'
,p_prompt=>'Minimum Value'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_is_common=>false
,p_default_value=>'0'
,p_escape_mode=>'HTML'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(78920969591930147)
,p_plugin_id=>wwv_flow_imp.id(78870330209392195)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_static_id=>'MAXIMUM_RANGE'
,p_prompt=>'Maximum Range'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_is_common=>false
,p_default_value=>'100'
,p_escape_mode=>'HTML'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(78921757029950588)
,p_plugin_id=>wwv_flow_imp.id(78870330209392195)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_static_id=>'STEP_NUMBER'
,p_prompt=>'Step Number'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_is_common=>false
,p_escape_mode=>'HTML'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(78980513051029295)
,p_plugin_id=>wwv_flow_imp.id(78870330209392195)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>120
,p_static_id=>'VALUE'
,p_prompt=>'Value'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(78983159288052778)
,p_plugin_id=>wwv_flow_imp.id(78870330209392195)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>130
,p_static_id=>'REGION_TITLE'
,p_prompt=>'Region Title'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'Chart'
,p_escape_mode=>'HTML'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(78985504661055155)
,p_plugin_id=>wwv_flow_imp.id(78870330209392195)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>150
,p_static_id=>'HEADER_NAME'
,p_prompt=>'Header Name'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'Dashboard'
,p_escape_mode=>'HTML'
,p_is_translatable=>false
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
