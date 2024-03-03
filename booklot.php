<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'vendor/phpmailer/phpmailer/src/Exception.php';
require 'vendor/phpmailer/phpmailer/src/PHPMailer.php';
require 'vendor/phpmailer/phpmailer/src/SMTP.php';

session_start();
include('config.php');

$car = $_POST['car'];
$lot = $_POST['lot'];
$uid = $_SESSION['log']['useruid'];
$otp1 = mt_rand(100000, 999999);
$otp2 = mt_rand(100000, 999999);

$phpmailer = new PHPMailer();
$phpmailer->isSMTP();
$phpmailer->Host = 'sandbox.smtp.mailtrap.io';
$phpmailer->SMTPAuth = true;
$phpmailer->Port = 2525;
$phpmailer->Username = '';
$phpmailer->Password = '';

$phpmailer->setFrom('contact.ecellvit@gmail.com', 'Your Name'); // Replace with your "From" name and email
$phpmailer->addAddress($_SESSION['log']['email']); // Recipient email
$phpmailer->Subject = 'Car Parking System OTP';
$phpmailer->Body = "Message via Car Parking System. This is your OTP1 (Enter while you park your car) " . $otp1 . ". This is your OTP2 (Enter while you leave the Parking Lot) " . $otp2 . ".";

if ($phpmailer->send()) {
    $qry = mysqli_query($con, "INSERT INTO logtable (useruid, lotname, carno, otp1, otp2) VALUES ('$uid', '$lot', '$car', '$otp1', '$otp2')");
    $qry1 = mysqli_query($con, "UPDATE lot SET status='Ongoing Booking' WHERE lotname='$lot'");
    header("location:verify.php");
} else {
    echo 'Error: ' . $phpmailer->ErrorInfo;
}
