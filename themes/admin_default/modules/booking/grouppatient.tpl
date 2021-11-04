<!-- BEGIN: main -->
<!-- BEGIN: view -->
<div class="well">
    <form action="{NV_BASE_ADMINURL}index.php" method="get">
        <input type="hidden" name="{NV_LANG_VARIABLE}"  value="{NV_LANG_DATA}" />
        <input type="hidden" name="{NV_NAME_VARIABLE}"  value="{MODULE_NAME}" />
        <input type="hidden" name="{NV_OP_VARIABLE}"  value="{OP}" />
        <div class="row">
            <div class="col-xs-24 col-md-6">
                <div class="form-group">
                    <input class="form-control" type="text" value="{Q}" name="q" maxlength="255" placeholder="{LANG.search_title}" />
                </div>
            </div>
            <div class="col-xs-12 col-md-3">
                <div class="form-group">
                    <input class="btn btn-primary" type="submit" value="Tra cứu" />
                </div>
            </div>
        </div>
    </form>
</div>
<form action="{NV_BASE_ADMINURL}index.php?{NV_LANG_VARIABLE}={NV_LANG_DATA}&amp;{NV_NAME_VARIABLE}={MODULE_NAME}&amp;{NV_OP_VARIABLE}={OP}" method="post">
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
            <thead>
                <tr>
                    <th class="w100">{LANG.weight}</th>
                    <th class="w100">
                        id excel
                    </th>
                    <th>Nhóm bệnh nhân</th>
                    <th>{LANG.description}</th>
                    <th>{LANG.time_add}</th>
                    <th>{LANG.time_edit}</th>
                    
                    <th class="w100 text-center">Trạng thái</th>
                    <th class="w150">Chức năng</th>
                </tr>
            </thead>
            <!-- BEGIN: generate_page -->
            <tfoot>
                <tr>
                    <td class="text-center" colspan="7">{NV_GENERATE_PAGE}</td>
                </tr>
            </tfoot>
            <!-- END: generate_page -->
            <tbody>
                <!-- BEGIN: loop -->
                <tr>
                    <td>
                        <select class="form-control" id="id_weight_{VIEW.id}" onchange="nv_change_weight('{VIEW.id}');">
                            <!-- BEGIN: weight_loop -->
                            <option value="{WEIGHT.key}"{WEIGHT.selected}>
                                {WEIGHT.title}
                            </option>
                            <!-- END: weight_loop -->
                        </select>
                    </td>
                    <td> 
                        {VIEW.id} 
                    </td>
                    <td> 
                        {VIEW.title} 
                    </td>
                    <td> 
                        {VIEW.description} 
                    </td>
                    <td> 
                        {VIEW.time_add} 
                    </td>
                    <td> 
                        {VIEW.time_edit} 
                    </td>
                    
                    <td class="text-center"><input type="checkbox" name="status" id="change_status_{VIEW.id}" value="{VIEW.id}" {CHECK} onclick="nv_change_status({VIEW.id});" /></td>
                    <td class="text-center"><i class="fa fa-edit fa-lg">&nbsp;</i> <a href="{VIEW.link_edit}#edit">{LANG.edit}</a> - <em class="fa fa-trash-o fa-lg">&nbsp;</em> <a href="{VIEW.link_delete}" onclick="return confirm(nv_is_del_confirm[0]);">{LANG.delete}</a></td>
                </tr>
                <!-- END: loop -->
            </tbody>
        </table>
    </div>
</form>
<!-- END: view -->

<!-- BEGIN: error -->
<div class="alert alert-warning">{ERROR}</div>
<!-- END: error -->

<form class="form-inline form-horizontal" action="{NV_BASE_ADMINURL}index.php?{NV_LANG_VARIABLE}={NV_LANG_DATA}&amp;{NV_NAME_VARIABLE}={MODULE_NAME}&amp;{NV_OP_VARIABLE}={OP}" method="post">
  <input type="hidden" name="id" value="{ROW.id}" />
  <table class="table table-striped table-bordered">
    <colgroup><col class="w200"><col></colgroup>
    <caption>
       <em class="fa fa-file-text-o">&nbsp;</em>Thêm nhóm bệnh nhân
   </caption>
   <tbody>
    <tr>
       <td>	
          <strong>{LANG.title}</strong> 
          <span class="red">(*)</span>
      </td>
      <td>
          <input class="form-control w500" type="text" name="title" value="{ROW.title}" required="required" oninvalid="setCustomValidity(nv_required)" oninput="setCustomValidity('')" />
      </td>
  </tr>
  <tr>
   <td>	
      <strong>{LANG.image}</strong>
  </td>
  <td>
      <input class="form-control" style="width:380px" type="text" name="logo" id="logo" value="{ROW.logo}"/>
      <input id="select-img-post" type="button" value="{LANG.select_image}" name="selectimg" class="btn btn-info" />
  </td>
</tr>
<tr>
   <td>	
      <strong> Ghi Chú</strong>
  </td>
  <td>
     <input class="form-control w500" type="text" name="description" value="{ROW.description}" />
 </td>
</tr>
<tr style="display:none">
   <td>	
     <strong>
         {LANG.status}
     </strong>
 </td>
 <td>
     <input class="form-control" type="text" name="status" value="1" pattern="^[0-9]*$"  oninvalid="setCustomValidity(nv_digits)" oninput="setCustomValidity('')" />
 </td>
</tr>
</tbody>
</table>
<div class="text-center">
 <div class="form-group" style="text-align: center">
    <input class="btn btn-primary" name="submit" type="submit" value="{LANG.save}" />
</div>
</div>
</form>



<script type="text/javascript">
    $("#select-img-post").click(function() {
        var area = "logo";
        var alt = "homeimgalt";
        var path = "{UPLOADS_DIR_USER}";
        var currentpath = "{UPLOADS_DIR_USER}";
        var currentfile = $('#homeimg').val();
        var type = "image";
        nv_open_browse(script_name + "?" + nv_name_variable + "=upload&popup=1&area=" + area + "&alt=" + alt + "&path=" + encodeURIComponent(path) + "&type=" + type + "&currentpath=" + encodeURIComponent(currentpath) + '&currentfile=' + encodeURIComponent(currentfile), "NVImg", 850, 420, "resizable=no,scrollbars=no,toolbar=no,location=no,status=no");
        return false;
    });
</script>

<script type="text/javascript">
//<![CDATA[
function nv_change_weight(id) {
    var nv_timer = nv_settimeout_disable('id_weight_' + id, 5000);
    var new_vid = $('#id_weight_' + id).val();
    $.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=brand&nocache=' + new Date().getTime(), 'ajax_action=1&id=' + id + '&new_vid=' + new_vid, function(res) {
        var r_split = res.split('_');
        if (r_split[0] != 'OK') {
            alert(nv_is_change_act_confirm[2]);
        }
        window.location.href = script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=brand';
        return;
    });
    return;
}


function nv_change_status(id) {
    var new_status = $('#change_status_' + id).is(':checked') ? true : false;
    if (confirm(nv_is_change_act_confirm[0])) {
        var nv_timer = nv_settimeout_disable('change_status_' + id, 5000);
        $.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=brand&nocache=' + new Date().getTime(), 'change_status=1&id='+id, function(res) {
            var r_split = res.split('_');
            if (r_split[0] != 'OK') {
                alert(nv_is_change_act_confirm[2]);
            }
        });
    }
    else{
        $('#change_status_' + id).prop('checked', new_status ? false : true);
    }
    return;
}


//]]>
</script>
<!-- END: main -->