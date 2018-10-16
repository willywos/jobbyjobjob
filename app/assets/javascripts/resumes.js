
var removeClosestObject;
removeClosestObject = function(target) {
  query = ".category." + target + " .actual_data > .object_data"
  return $(query).last().remove();
};