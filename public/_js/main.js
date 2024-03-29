/**
 * https://ipfinder.io
 * Date: 2019-06-22
 * Version: 1.0.0
 * License: MIT
 * author: Mohamed Benrebia <mohamed@ipfinder.io>
 *
 */
$(document).ready(function(f) {
  if (!b) {
    var b = {};
  }
  b.json = {replacer:function(a, b, c, d, e) {
    a = b || "";
    c && (a = a + "<span class=json-key>" + c.replace(/[": ]/g, "") + "</span>: ");
    d && (a = a + ('"' == d[0] ? "<span class=json-string>" : "<span class=json-value>") + d + "</span>");
    return a + (e || "");
  }, prettyPrint:function(a) {
    return JSON.stringify(a, null, 3).replace(/&/g, "&amp;").replace(/\\"/g, "&quot;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/^( *)("[\w]+": )?("[^"]*"|[\w.+-]*)?([,[{])?$/mg, b.json.replacer);
  }};
  $(".button").click(function() {
    $.ajax({type:"POST", url:"http://ipfinder."+location.host +"/v1/" + $("input[name='ipasn']").val(), data:{token:$("input[name='token']").val()}, error:function(a, b, c) {
      alert(b + " " + c);
    }, success:function(a) {
      console.log(a);
      $("#req").css("display", "grid");
      JSON.stringify(a, void 0, 2);
      $("#account").html(b.json.prettyPrint(a));
      $("#hid").css("display", "none");
    }});
  });
});
$(".ret").click(function() {
  $("#req").css("display", "none");
  $("#hid").css("display", "grid");
});
