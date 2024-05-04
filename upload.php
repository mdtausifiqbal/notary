<?php
$target_dir = "uploads/";

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_FILES['files'])) {
    $response = [];
    $allowed_file_type = ['image/jpeg', 'image/jpg', 'image/png', 'application/pdf']; // Add the file types you want to allow
    $file = $_FILES['files'];


    if($file['error'] === UPLOAD_ERR_OK){
        // check if the files extension is allowed
        if(in_array($file['type'], $allowed_file_type)){
            $target_file = $target_dir . basename($file['name']);
            if (move_uploaded_file($file['tmp_name'], $target_file)) {
                $fileUrl = $target_file; // Replace with your actual domain
                $createdAt = new DateTime(null, new DateTimeZone('UTC'));
                $createdAt = $createdAt->format('Y-m-d H:i:s'); // Current date and time
                $createdBy = 'Admin'; // Replace with the actual user's name

                $response = [
                    'fileUrl' => $fileUrl,
                    'createdAt' => $createdAt,
                    'createdBy' => $createdBy
                ];
            } else {
                $response = [
                    'error' => 'Sorry, there was an error uploading your file.'
                ];
            }
        }else{
            $response = [
                'error' => 'Invalid file type'
            ];
        }
    } else {
        $response = [
            'error' => 'Upload failed with error code'
        ];

    }

    header('Content-Type: application/json');
    echo json_encode($response);
}
?>