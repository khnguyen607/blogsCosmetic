-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th5 15, 2024 lúc 10:37 AM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `cosmetic`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blogs`
--

CREATE TABLE `blogs` (
  `ID` int NOT NULL,
  `Name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Subtitle` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Img` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `blogs`
--

INSERT INTO `blogs` (`ID`, `Name`, `Subtitle`, `Content`, `Date`, `Img`) VALUES
(1, 'Bài viết 1', 'Đây là tóm tắt bài viết 1', 'Đây là nội dung bài viết 1', '2024-05-15 13:47:07', 'blogs/blog1.png'),
(2, 'Bài viết 2', 'Đây là tóm tắt bài viết 2', 'Đây là nội dung bài viết 2', '2024-05-15 13:47:07', 'blogs/blog2.png'),
(3, 'Bài viết 3', 'Đây là tóm tắt bài viết 3', 'Đây là nội dung bài viết 3', '2024-05-15 13:47:07', 'blogs/blog3.png'),
(4, 'Bài viết 4', 'Đây là tóm tắt bài viết 4', 'Đây là nội dung bài viết 4', '2024-05-15 13:47:07', 'blogs/blog-details-3.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `ID` int NOT NULL,
  `Name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`ID`, `Name`) VALUES
(1, 'Chăm sóc da'),
(2, 'Chăm sóc tóc'),
(3, 'Sản phẩm tự nhiên'),
(4, 'Hàng nhập khẩu');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `ID` int NOT NULL,
  `Content` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `parentCommentID` int DEFAULT NULL,
  `userID` int NOT NULL,
  `blogID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`ID`, `Content`, `Date`, `parentCommentID`, `userID`, `blogID`) VALUES
(17, 'Bình luận 1', '2024-05-15 08:35:39', NULL, 2, 1),
(20, 'Bình luận 1.1', '2024-05-15 08:40:29', 17, 2, 1),
(21, 'Bình luận 1.1.1', '2024-05-15 08:41:05', 20, 2, 1),
(22, 'Bình luận 2', '2024-05-15 08:41:25', NULL, 2, 1),
(23, 'Bình luận 3', '2024-05-15 08:41:25', NULL, 2, 1),
(24, 'Bình luận 2.1', '2024-05-15 08:42:07', 22, 2, 1),
(25, 'Bình luận 2.2', '2024-05-15 08:42:07', 22, 2, 1),
(26, 'Bình luận 1.2', '2024-05-15 16:17:43', 17, 2, 1),
(27, 'Bình luận 2.3', '2024-05-15 16:28:19', 22, 2, 1),
(28, 'Bình luận 4', '2024-05-15 16:32:31', NULL, 2, 1),
(29, '3. Bình luận 1', '2024-05-15 16:34:24', NULL, 2, 3),
(30, '3. Bình luận 1.1', '2024-05-15 16:34:39', 29, 2, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `syn_blogs_categories`
--

CREATE TABLE `syn_blogs_categories` (
  `ID` int NOT NULL,
  `categoryID` int NOT NULL,
  `blogID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `syn_blogs_categories`
--

INSERT INTO `syn_blogs_categories` (`ID`, `categoryID`, `blogID`) VALUES
(1, 1, 2),
(2, 1, 1),
(3, 4, 1),
(4, 2, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `ID` int NOT NULL,
  `Name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Username` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Password` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`ID`, `Name`, `Username`, `Password`) VALUES
(2, 'Khôi Nguyên', 'khnguyen', '$2y$10$E1JaM6tznEkiXpxbWcaiauAlkExQ.obsX5uJsEpQZ5BbwJokpLscu');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `comments_users` (`userID`),
  ADD KEY `comments_blogs` (`blogID`),
  ADD KEY `comments_comments` (`parentCommentID`);

--
-- Chỉ mục cho bảng `syn_blogs_categories`
--
ALTER TABLE `syn_blogs_categories`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `syn_blogs_categories_categories` (`categoryID`),
  ADD KEY `syn_blogs_categories_blogs` (`blogID`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `blogs`
--
ALTER TABLE `blogs`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `syn_blogs_categories`
--
ALTER TABLE `syn_blogs_categories`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_blogs` FOREIGN KEY (`blogID`) REFERENCES `blogs` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `comments_comments` FOREIGN KEY (`parentCommentID`) REFERENCES `comments` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `comments_users` FOREIGN KEY (`userID`) REFERENCES `users` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `syn_blogs_categories`
--
ALTER TABLE `syn_blogs_categories`
  ADD CONSTRAINT `syn_blogs_categories_blogs` FOREIGN KEY (`blogID`) REFERENCES `blogs` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `syn_blogs_categories_categories` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
