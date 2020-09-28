// 隐藏登陆框
// var isFrameVisible = 0;
// function show_frame(){
//     var f_obj = document.getElementById("frame");
//     if(isFrameVisible==0){
//         f_obj.style.visibility = "visible";
//         isFrameVisible = 1;
//     }
//     else{
//         f_obj.style.visibility = "hidden";
//         isFrameVisible = 0;
//     }
// }

function show_frame(){
    obj_frame = document.getElementById("frame");
    obj_frame.style.opacity = 0.5;
    obj_txt = document.getElementById("txt");
    obj_txt.style.opacity = 0;
}