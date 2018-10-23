
var removeClosestObject;
removeClosestObject = function(target, object_target="") {
  query = ".category." + target + " .actual_data > .object_data" + object_target
  return $(query).last().remove();
};

var initForm;
initForm = function() {

  $(document).ready(function() {
    $(".resume_form input[name^='resume[data']").change(function() {
      triggerRefresh();
    });
    triggerRefresh();
  });
};

var triggerRefresh;
triggerRefresh = function() {
  old_target = $(".resume_form").attr("target");
  old_action = $(".resume_form").attr("action");
  old_method = $(".resume_form").find("input[name='_method']").val();

  target = $("iframe[name='preview']").attr("data-target");
  action = $("iframe[name='preview']").attr("data-action");

  $(".resume_form").attr("target", target);
  $(".resume_form").attr("action", action);
  $(".resume_form").find("input[name='_method']").val("post");
  $(".resume_form").submit();

  $(".resume_form").removeAttr("target");
  $(".resume_form").attr("action", old_action);
  $(".resume_form").find("input[name='_method']").val(old_method);
};


function getFormData($form){
    var unindexed_array = $form.serializeArray();
    var indexed_array = {};

    $.map(unindexed_array, function(n, i){
        indexed_array[n['name']] = n['value'];
    });

    return indexed_array;
}
