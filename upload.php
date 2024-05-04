<?php
$target_dir = "uploads/";

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_FILES['files'])) {
    $response = [];
    $allowed_file_type = ['image/jpeg', 'image/jpg', 'image/png', 'application/pdf']; // Add the file types you want to allow
    $file = $_FILES['files'];
    $max_file_size = 8388608; // 8MB in bytes

    if ($file['error'] === UPLOAD_ERR_OK) {
        // check if the files extension is allowed
        if (in_array($file['type'], $allowed_file_type)) {
            // check if the file size is within the allowed limit
            if ($file['size'] < $max_file_size) {
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
            } else {
                $response = [
                    'error' => 'File size is too large. Maximum file size allowed is 8MB'
                ];
            }
        } else {
            $response = [
                'error' => 'Invalid file type'
            ];
        }
    } else {
        $response = [
            'error' => 'Upload failed with error code'
        ];
    }

    if (isset($response['error'])) {
        http_response_code(400);
    } else {
        http_response_code(200);
    }

    header('Content-Type: application/json');

    echo json_encode($response);
}
