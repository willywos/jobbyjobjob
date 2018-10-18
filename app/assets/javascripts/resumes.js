
var removeClosestObject;
removeClosestObject = function(target, object_target="") {
  query = ".category." + target + " .actual_data > .object_data" + object_target
  return $(query).last().remove();
};