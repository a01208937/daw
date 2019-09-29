<?php

if (isset($_POST['submit_img'])) {
    if (($_FILES['imgToUpload']['name']!="")) {
        $target_dir = "img/";
        $file = $_FILES['imgToUpload']['name'];
        $path = pathinfo($file);
        $filename = $path['filename'];
        $ext = $path['extension'];
        $temp_name = $_FILES['imgToUpload']['tmp_name'];
        $path_filename_ext = $target_dir.$filename.".".$ext;
        // Check if file already exists
        if (file_exists($path_filename_ext)) {
            echo "Sorry, file already exists.";
        }else{
           move_uploaded_file($temp_name,$path_filename_ext);
           echo "<img src=".$path_filename_ext." height=400 width=700 />";
        }
    }
}

?>