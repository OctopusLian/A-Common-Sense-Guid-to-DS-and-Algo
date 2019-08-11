
function hasDuplicateValue(array) {
    var existingNumbers = [];
    for(var i = 0; i < array.length; i++) {
        if(existingNumbers[array[i]] === undefined) {  //每发现一个新数字
            existingNumbers[array[i]] = 1;  //找出数组下标对应的数字，并置为1
        } else {
            return true;
        }
    }
    return false;
}