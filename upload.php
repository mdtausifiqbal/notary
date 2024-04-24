<?php
$target_dir = "uploads/";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $response = [];

    foreach ($_FILES['files']['name'] as $i => $name) {
        if ($_FILES['files']['error'][$i] === UPLOAD_ERR_OK) {
            $target_file = $target_dir . basename($name);
            if (move_uploaded_file($_FILES['files']['tmp_name'][$i], $target_file)) {
                $fileUrl = $target_file; // Replace with your actual domain
                $createdAt = date('Y-m-d H:i:s'); // Current date and time
                $createdBy = 'Your Name'; // Replace with the actual user's name

                $response[] = [
                    'fileUrl' => $fileUrl,
                    'createdAt' => $createdAt,
                    'createdBy' => $createdBy
                ];
            } else {
                $response[] = [
                    'error' => 'Sorry, there was an error uploading your file.'
                ];
            }
        }
    }

    header('Content-Type: application/json');
    echo json_encode($response);
}
?>