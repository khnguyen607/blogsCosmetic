-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th5 15, 2024 lúc 03:41 PM
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
-- Cấu trúc bảng cho bảng `author`
--

CREATE TABLE `author` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pass` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `role` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `author`
--

INSERT INTO `author` (`id`, `name`, `email`, `user`, `pass`, `status`, `role`) VALUES
(0, 'QUẢN TRỊ VIÊN', '', 'admin', '$2y$10$vnb8PdkfV9Sb439eCxsc.eAns8VxqoXw5dmM45/Dg9tpTi3tOwHTe', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blogs`
--

CREATE TABLE `blogs` (
  `ID` int NOT NULL,
  `Name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Subtitle` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Img` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `userID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `blogs`
--

INSERT INTO `blogs` (`ID`, `Name`, `Subtitle`, `Content`, `Date`, `Img`, `userID`) VALUES
(1, 'Bài viết 1', 'Đây là tóm tắt bài viết 1', '<p>Đây là nội dung bài viết 1</p>', '2024-05-15 13:47:07', 'blogs/blog1.png', 3),
(2, 'Bài viết 2', 'Đây là tóm tắt bài viết 2', 'Đây là nội dung bài viết 2', '2024-05-15 13:47:07', 'blogs/blog2.png', 3),
(3, 'Bài viết 3', 'Đây là tóm tắt bài viết 3', 'Đây là nội dung bài viết 3', '2024-05-15 13:47:07', 'blogs/blog3.png', 3),
(4, 'Bài viết 4', 'Đây là tóm tắt bài viết 4', 'Đây là nội dung bài viết 4', '2024-05-15 13:47:07', 'blogs/blog-details-3.jpg', 3),
(5, 'Bài viết test', 'Nội dung bài viết được thêm test', '<h1>Bài viết được thêm chi tiết</h1><p><strong>đây là bài viết được thêm</strong></p><ol><li>điều 1</li><li>điều 2</li><li>điều 3</li></ol>', '2024-05-15 22:01:36', 'blogs/khanhvd.png', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `ID` int NOT NULL,
  `Name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
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
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `status`) VALUES
(1, 'Kỹ năng sống', 1),
(2, 'Học tiếng anh', 1),
(3, 'Học office', 1),
(4, 'Tự học photoshop', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `ID` int NOT NULL,
  `Content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `parentCommentID` int DEFAULT NULL,
  `userID` int NOT NULL,
  `blogID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`ID`, `Content`, `Date`, `parentCommentID`, `userID`, `blogID`) VALUES
(22, 'Bình luận 2', '2024-05-15 08:41:25', NULL, 2, 1),
(23, 'Bình luận 3', '2024-05-15 08:41:25', NULL, 2, 1),
(24, 'Bình luận 2.1', '2024-05-15 08:42:07', 22, 2, 1),
(25, 'Bình luận 2.2', '2024-05-15 08:42:07', 22, 2, 1),
(27, 'Bình luận 2.3', '2024-05-15 16:28:19', 22, 2, 1),
(29, '3. Bình luận 1', '2024-05-15 16:34:24', NULL, 2, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int NOT NULL,
  `title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `img` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `author_id` int NOT NULL,
  `category_id` int NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `views` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `img`, `author_id`, `category_id`, `date`, `views`, `status`) VALUES
(1, '13 tips giúp bạn ngủ ngon hơn (theo nghiên cứu khoa học)', '<p>Như các bạn đã biết thì 3 trụ cột chính của sức khỏe con người đó là: Giấc ngủ, tập thể dục và chế độ dinh dưỡng.</p><p>Tuy nhiên, đa số mọi người đều chỉ quan tâm tới việc tập thể dục và chế độ dinh dưỡng mà chưa dành sự quan tâm đúng mức tới giấc ngủ.</p><p>Vậy nên hôm nay mình sẽ chia sẻ với các bạn một số tips để giúp mọi người có thể cải thiện giấc ngủ của mình.</p><h3><strong>Làm thế nào để ngủ ngon hơn?</strong></h3><p><strong>1)</strong>&nbsp;Thức dậy và chạy ra ngoài để ngắm bình minh trong khoảng ít nhất là 10 phút, nếu trời âm u thì sẽ lâu hơn, khoảng 20 phút.</p><p><strong>2)</strong>&nbsp;Ngồi học và làm việc ở nơi có nhiều ánh sáng tự nhiên.</p><p><strong>3)</strong>&nbsp;Chỉ uống cà phê hoặc những thứ có chứa caffeine sau khi thức dậy khoảng từ 90 tới 120 phút và dừng uống cà phê sau 4 giờ chiều.</p><p>Tốt nhất là bạn nên dừng uống cà phê từ 8 tới 10 tiếng trước giờ đi ngủ.</p><p><strong>4)</strong>&nbsp;Ra ngoài ngắm hoàng hôn ít nhất là 10 phút, trong những ngày âm u thì sẽ lâu hơn, khoảng 20 phút.</p><p>(Việc ngắm bình minh và hoàng hôn là nhằm để giúp cài đặt lại đồng hồ sinh học của cơ thể bạn, giúp nó vận hành một cách chính xác và trơn tru hơn)</p><p><strong>5)</strong>&nbsp;Không ngồi thiền trong khoảng thời gian 4 tiếng trước giờ đi ngủ.</p><p><strong>6)</strong>&nbsp;Đeo kính râm vào ban đêm để tránh việc mắt phải tiếp xúc với ánh sáng cường độ mạnh.</p><p>Ánh sáng cường độ mạnh có thể làm sai lệch một cách nghiêm trọng đồng hồ sinh học của bạn.</p><blockquote>No joke, đây có lẽ là một trong những tips hữu dụng nhất để giúp mình cải thiện giấc ngủ.</blockquote><blockquote>Từ ngày đeo kính râm vào ban đêm thì mình thấy là giấc ngủ của mình được cải thiện rõ rệt và việc chìm vào giấc ngủ trở nên dễ dàng hơn rất nhiều.</blockquote><p><strong>7)</strong>&nbsp;Tập thể dục ngay sau khi thức dậy để giúp mình có thể dậy sớm hơn vào ngày hôm sau.</p><p>Nhưng nếu như bạn không muốn dậy sớm hơn thì có lẽ là không cần sử dụng cái này.</p><p><strong>8)</strong>&nbsp;Không tập thể dục quá mạnh và quá khuya bởi vì nó có thể làm sai lệch và delay đồng hồ sinh học của bạn và khiến bạn khó đi vào giấc ngủ hơn.</p><p><strong>9)</strong>&nbsp;Cố gắng cài đặt các nguồn ánh sáng thấp hơn tầm mắt của mình và khiến cho không gian xung quanh của mình trở nên tối nhất có thể.</p><p>Ánh sáng cao hơn tầm mắt của bạn sẽ khiến não lầm tưởng đó là ánh sáng mặt trời và làm sai lệch đồng hồ sinh học của bạn.</p><p><strong>10)</strong>&nbsp;Tạo một thời gian chuyển giao giữa những công việc thường ngày và thời gian bạn đi ngủ để giúp não bạn được thư giãn và dễ chìm vào giấc ngủ hơn.</p><p>Bạn có thể đọc sách hay làm cái gì đó mà bạn cảm thấy phù hợp và yêu thích, miễn là nó khiến bạn cảm thấy thư giãn và không tạo ra quá nhiều cảm xúc mạnh là được.</p><p>Nhưng nhớ là hạn chế tối đa việc để mắt mình tiếp xúc với ánh sáng cường độ mạnh.</p><p>Đối với mình thì mình thường tập NSDR hay còn có một cái tên khác là Yoga Nidra khoảng 20 phút trước khi đi ngủ.</p><p>Đây cũng là một trong những tips hữu ích nhất trong việc giúp mình cải thiện giấc ngủ.</p><p>Bạn hãy tưởng tượng là bộ não của bạn cũng giống như một cái máy bay vậy, nó cần phải có thời gian để giảm tốc độ và hạ cánh chứ không phải giống như một cái công tắc mà bạn có thể bấm một cái là nó sẽ chuyển sang trạng thái thư giãn và rơi vào giấc ngủ ngay được.</p>', 'https://blogchiasekienthuc.com/wp-content/uploads/2023/06/nhung-tips-giup-ngu-ngon-hon-1.jpg', 0, 1, '2024-05-03 17:56:51', 1, 1),
(2, '20+ nguyên tắc xã giao cơ bản nhất định bạn phải biết', '<p><span style=\"color: rgb(10, 0, 10);\">Lướt Facebook thấy nội dung này khá là hay và thiết thực nên mình chia sẻ lại với các bạn, cũng là để lưu lại để thỉnh thoảng đọc và suy ngẫm ^^</span></p><p><strong>1)</strong>&nbsp;Làm người phải chân thành, đừng kiêu ngạo, khiêm tốn nhưng đừng khiến mình trở nên quá nhỏ bé.</p><p>Thái độ làm việc phải hết mình, đừng giả vờ cố gắng, học cách “dụi mắt bảy lần”, cẩn thận không để bị lừa cũng là một loại bản lĩnh.</p><p><strong>2)</strong>&nbsp;Học cách “đứng thẳng người”, đừng khom lưng cúi đầu. Bạn cần biết rằng, bạn càng tỏ ra yếu đuối, người khác càng nảy sinh ra cảm giác muốn bắt nạt bạn.</p><p><strong>3)</strong>&nbsp;Khiêm tốn nhưng không được thấp cổ bé họng, không có lập trường.</p><p>Khiêm tốn là một trí tuệ giúp sinh tồn, là đạo làm người trong xử thế, nhưng thấp cổ bé họng lại cho thấy năng lực thấp kém, là biểu hiện của kẻ vô năng.</p><p><strong>4)</strong>&nbsp;Đừng bao giờ nghe ngóng chuyện riêng tư của người khác.</p><p>Khi bạn thích đi “hóng hớt” chuyện của người khác, người ta sẽ cho rằng bạn muốn xen vào chuyện riêng của họ. Người thông minh sẽ vĩnh viễn giữ khoảng cách với bạn, người hẹp hòi sẽ tìm cách “chơi” lại bạn.</p><p><strong>5)</strong>&nbsp;Đừng hứa hẹn với người khác điều gì, hãy nhớ rằng: Lời hứa nhất định phải được thực hiện, nếu không người khác sẽ gắn cho bạn cái mác “không đáng tin”.</p><p><strong>6)</strong>&nbsp;Quan hệ có thân thiết tới đâu, cũng cần giữ chừng mực. Người không biết chừng mực là người không có quy tắc, người khác tự nhiên sẽ không tôn trọng hay thích bạn và tất nhiên cũng sẽ chẳng muốn giúp bạn.</p><p><strong>7)</strong>&nbsp;Giữ khoảng cách nhất định với người khác giới mới là quan hệ xã giao đúng mực nhất.</p><p><strong>8)</strong>&nbsp;Học cách chậm lại. Càng vội vàng càng dễ hỏng việc. Xã hội xô bồ, vồn vã, chỉ khi bạn “tĩnh” lại, bạn mới có thể tránh được rắc rối mà khi vội vã h.ỗn l.oạn bạn không nhìn thấy.</p><p><strong>9)</strong>&nbsp;Cẩn thận với những người đột nhiên cố ý tiếp cận bạn hoặc nối lại tương tác với bạn mà không nêu ra lý do cụ thể ngay từ đầu.</p><p><strong>10)</strong>&nbsp;Đừng bao giờ để người khác giúp bạn miễn phí.</p><p>Chỉ khi bạn trả phí cho sự giúp đỡ của người khác, bất kể dưới dạng gì, hay nói đơn giản là có qua có lại thì bạn mới có thể đường đường chính chính ngẩng cao đầu.</p><iframe class=\"ql-video\" frameborder=\"0\" allowfullscreen=\"true\" src=\"https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-3021688763784412&amp;output=html&amp;h=280&amp;slotname=9608144480&amp;adk=873220442&amp;adf=2852916478&amp;pi=t.ma~as.9608144480&amp;w=586&amp;abgtt=6&amp;fwrn=4&amp;fwrnh=100&amp;lmt=1714721027&amp;rafmt=1&amp;format=586x280&amp;url=https%3A%2F%2Fblogchiasekienthuc.com%2Fky-nang%2Fnguyen-tac-xa-giao-co-ban.html&amp;fwr=0&amp;fwrattr=true&amp;rpe=1&amp;resp_fmts=3&amp;wgl=1&amp;uach=WyJXaW5kb3dzIiwiMTUuMC4wIiwieDg2IiwiIiwiMTI0LjAuNjM2Ny4xMTkiLG51bGwsMCxudWxsLCI2NCIsW1siQ2hyb21pdW0iLCIxMjQuMC42MzY3LjExOSJdLFsiR29vZ2xlIENocm9tZSIsIjEyNC4wLjYzNjcuMTE5Il0sWyJOb3QtQS5CcmFuZCIsIjk5LjAuMC4wIl1dLDBd&amp;dt=1714733870738&amp;bpp=1&amp;bdt=187&amp;idt=266&amp;shv=r20240501&amp;mjsv=m202404300101&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3D4cfb8941d7b3ed54%3AT%3D1714733561%3ART%3D1714733561%3AS%3DALNI_MYhozkGdhyCvo6Urzg9ssNTw4PcJA&amp;gpic=UID%3D00000e07e8cf2555%3AT%3D1714733561%3ART%3D1714733561%3AS%3DALNI_MbCCVi0SWKOCF6URLwNf5sHI8ouLA&amp;eo_id_str=ID%3D8cc0dddbfcd86423%3AT%3D1714733561%3ART%3D1714733561%3AS%3DAA-AfjbQslaPEHO7rXVzbCxZerWd&amp;prev_fmts=0x0%2C592x148%2C592x280&amp;nras=1&amp;correlator=1996735534367&amp;frm=20&amp;pv=1&amp;ga_vid=1554363743.1714733561&amp;ga_sid=1714733871&amp;ga_hid=1035312577&amp;ga_fc=1&amp;u_tz=420&amp;u_his=1&amp;u_h=1920&amp;u_w=1080&amp;u_ah=1920&amp;u_aw=1080&amp;u_cd=24&amp;u_sd=1&amp;dmc=8&amp;adx=103&amp;ady=3321&amp;biw=1063&amp;bih=1831&amp;scr_x=0&amp;scr_y=0&amp;eid=44759876%2C44759927%2C44759842%2C95331983%2C95329830%2C95331042%2C31078663%2C31078665%2C31078668%2C31078670&amp;oid=2&amp;pvsid=2758447865277240&amp;tmod=1076351485&amp;uas=0&amp;nvt=1&amp;ref=https%3A%2F%2Fblogchiasekienthuc.com%2Fky-nang%2Fky-nang-song&amp;fc=1920&amp;brdim=0%2C0%2C0%2C0%2C1080%2C-840%2C0%2C0%2C1080%2C1831&amp;vis=1&amp;rsz=%7C%7CEebr%7C&amp;abl=CS&amp;pfx=0&amp;fu=128&amp;bc=31&amp;bz=0&amp;td=1&amp;psd=W251bGwsbnVsbCxudWxsLDNd&amp;nt=1&amp;ifi=4&amp;uci=a!4&amp;btvi=1&amp;fsb=1&amp;dtd=467\" height=\"0\" width=\"586\"></iframe><p><br></p><p><strong>11)</strong>&nbsp;Đừng bao giờ tranh luận với những người không cùng tầng tri thức với bạn, bởi lẽ họ sẽ kéo bạn xuống tầng tri thức của họ rồi sau đó tranh luận với bạn không hồi kết.</p><p><strong>13)</strong>&nbsp;Mọi mối quan hệ xã giao đều nên được thiết lập trên cơ sở mọi bên đều thắng (đôi bên cùng win-win).</p><p>Nếu chỉ khư khư một mình bạn thắng, một mình bạn có lợi, thì thực ra là bạn đang thua. Vì sẽ không còn ai muốn giao lưu/hợp tác với bạn nữa.</p><p><strong>14)</strong>&nbsp;Đừng bao giờ nghĩ rằng bạn cho ai cái gì thì nhất định phải nhận lại từng đó từ người ấy, đặc biệt là tình cảm. Nếu mọi thứ đều có thể sòng phẳng thì trên đời đã không có nhiều b.i k.ị.ch như vậy.</p><p><strong>15)</strong>&nbsp;Học cách biết ơn, học cách trở thành “quý nhân” của người khác, rồi bạn có thể gặp được “quý nhân” của mình.</p><p><strong>16)</strong>&nbsp;Nói chuyện với người khác, đừng nhìn điện thoại, trừ phi bạn có ý định muốn kết thúc cuộc nói chuyện.</p><p><strong>17)</strong>&nbsp;Trước mắt không bình luận người khác tốt xấu, sau lưng không bàn tán thị phi. Chỉ có những kẻ ng.u ng.ố.c và vô công rồi nghề mới đi bàn tán sau lưng người khác.</p><p><strong>18)</strong>&nbsp;Học cách giữ thể diện cho người khác, đó mới là thể diện lớn nhất của bản thân. Tuyệt đối đừng để người khác cho bạn “thể diện”, kể cả khi bạn cầu xin người khác giữ thể diện cho mình.</p><p><strong>19)</strong>&nbsp;Không than phiền. Người hay than phiền tưởng là phàn nàn có thể giải tỏa tâm lý u ám, nhưng họ đã tìm sai cách.</p><p>Than phiền là cách tập hợp năng lượng tiêu cực nhanh nhất, bạn càng than thở nhiều, tâm trạng càng không tốt, mọi việc sẽ càng không thuận lợi.</p><p><strong>20)</strong>&nbsp;Nhận thức rõ ai mới là vai chính. Hoàn cảnh mỗi cuộc giao tiếp qua lại đều khác nhau, nhân vật chính mới là quan trọng nhất.</p>', 'https://blogchiasekienthuc.com/wp-content/uploads/2022/09/nguyen-tac-xa-giao-co-ban.jpg', 0, 1, '2024-05-03 18:00:16', 2, 1),
(3, '1000 từ vựng tiếng Anh chuyên ngành Công Nghệ Thông Tin', '<h3><strong style=\"color: rgb(0, 128, 0);\">#1. Làm thế nào để sử dụng công cụ này?</strong></h3><p>Vâng, với công cụ trực tuyến này thì bạn có thể dễ dàng học được hơn 1000<strong>&nbsp;từ vựng Tiếng Anh chuyên ngành Công Nghệ Thông Tin</strong>&nbsp;(đây là những từ thường gặp nhất).</p><p>Công cụ trực tuyến này sẽ có 3 tab chính, bao gồm:</p><ol><li><strong>LUYỆN TẬP:</strong>&nbsp;Bạn nhấn vào nút này để học từ vựng, nhấn vào mũi tên sang trái sang phải. Nếu bạn thấy thích từ vựng nào thì nhấn vào dấu sao (bookmark) để lưu. Nhấn mũi tên sang phải lần 1 sẽ xuất hiện Từ vựng cần học, nhấn mũi tên lần 2 sẽ hiển thị nghĩa của từ đó.</li><li><strong>CÁC TỪ VỰNG ĐÃ LƯU:</strong>&nbsp;Những từ vựng đã lưu sẽ được hiển thị trong này.</li><li><strong>DANH SÁCH TỪ VỪNG:</strong>&nbsp;Tại đây sẽ lưu trữ toàn bộ các từ vựng hiện có trong kho lưu trữ, có tổng cộng hơn 1000 từ vựng được phân loại theo ký tự đầu (A, B, C….).</li></ol><h3><strong>#2. Kinh nghiệm ôn luyện từ vựng ngành Công nghệ Thông Tin</strong></h3><h4><strong style=\"color: rgb(0, 128, 0);\">+) Đối với điện thoại</strong></h4><p>Bạn nhấn giữ để bôi đen từ cần dịch =&gt; chọn&nbsp;<code style=\"color: rgb(34, 38, 34); background-color: rgba(242, 255, 255, 0.45);\">Dịch</code>&nbsp;để dịch hoặc nghe cách phát âm.</p><h4><strong style=\"color: rgb(0, 128, 0);\">+) Đối với máy tính</strong></h4><p>Chia sẻ thêm với các bạn một thủ thuật giúp bạn học Tiếng Anh hiệu quả hơn thông qua công cụ này đó là:</p><iframe class=\"ql-video ql-align-center\" frameborder=\"0\" allowfullscreen=\"true\" src=\"https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-3021688763784412&amp;output=html&amp;h=280&amp;slotname=8946710631&amp;adk=1932902992&amp;adf=1149896403&amp;pi=t.ma~as.8946710631&amp;w=592&amp;abgtt=6&amp;fwrn=4&amp;fwrnh=100&amp;lmt=1714734044&amp;rafmt=1&amp;format=592x280&amp;url=https%3A%2F%2Fblogchiasekienthuc.com%2Fky-nang%2Ftu-vung-tieng-anh-cong-nghe-thong-tin.html&amp;fwr=0&amp;fwrattr=true&amp;rpe=1&amp;resp_fmts=3&amp;wgl=1&amp;uach=WyJXaW5kb3dzIiwiMTUuMC4wIiwieDg2IiwiIiwiMTI0LjAuNjM2Ny4xMTkiLG51bGwsMCxudWxsLCI2NCIsW1siQ2hyb21pdW0iLCIxMjQuMC42MzY3LjExOSJdLFsiR29vZ2xlIENocm9tZSIsIjEyNC4wLjYzNjcuMTE5Il0sWyJOb3QtQS5CcmFuZCIsIjk5LjAuMC4wIl1dLDBd&amp;dt=1714734044203&amp;bpp=2&amp;bdt=443&amp;idt=155&amp;shv=r20240501&amp;mjsv=m202404300101&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3D4cfb8941d7b3ed54%3AT%3D1714733561%3ART%3D1714733871%3AS%3DALNI_MYhozkGdhyCvo6Urzg9ssNTw4PcJA&amp;gpic=UID%3D00000e07e8cf2555%3AT%3D1714733561%3ART%3D1714733871%3AS%3DALNI_MbCCVi0SWKOCF6URLwNf5sHI8ouLA&amp;eo_id_str=ID%3D8cc0dddbfcd86423%3AT%3D1714733561%3ART%3D1714733871%3AS%3DAA-AfjbQslaPEHO7rXVzbCxZerWd&amp;prev_fmts=0x0%2C592x148%2C262x600&amp;nras=1&amp;correlator=3529591214899&amp;frm=20&amp;pv=1&amp;ga_vid=167118462.1714733561&amp;ga_sid=1714734044&amp;ga_hid=1408568871&amp;ga_fc=1&amp;ga_cid=1554363743.1714733561&amp;u_tz=420&amp;u_his=1&amp;u_h=1920&amp;u_w=1080&amp;u_ah=1920&amp;u_aw=1080&amp;u_cd=24&amp;u_sd=1&amp;dmc=8&amp;adx=100&amp;ady=4079&amp;biw=1063&amp;bih=1831&amp;scr_x=0&amp;scr_y=0&amp;eid=44759876%2C44759927%2C44759842%2C95329717%2C95331982%2C95331042%2C31078663%2C31078665%2C31078668%2C31078670&amp;oid=2&amp;psts=AOrYGsmULVNZ0nr0mVePnJjXAvapyXQeP8vcQGH2v55c-EvRjUmYhSv1t6tugSbPezsTUsLu0duGrFZhA1pBTuWxhcSR9Kw&amp;pvsid=2286918187010807&amp;tmod=1076351485&amp;uas=0&amp;nvt=1&amp;ref=https%3A%2F%2Fblogchiasekienthuc.com%2Fky-nang%2Fhoc-tieng-anh&amp;fc=1920&amp;brdim=0%2C0%2C0%2C0%2C1080%2C-840%2C0%2C0%2C1080%2C1831&amp;vis=1&amp;rsz=%7C%7CEebr%7C&amp;abl=CS&amp;pfx=0&amp;fu=128&amp;bc=31&amp;bz=0&amp;td=1&amp;psd=W251bGwsbnVsbCxudWxsLDNd&amp;nt=1&amp;ifi=3&amp;uci=a!3&amp;btvi=1&amp;fsb=1&amp;dtd=1100\" height=\"0\" width=\"592\"></iframe><p class=\"ql-align-center\"><br></p><p>Bạn hãy cài thêm tiện ích mở rộng Google Dịch và Google Dictionary&nbsp;hoặc là bất cứ tiện ích nào có tính năng tương tự.</p><blockquote>Nếu bạn muốn xem chi tiết các bước cài đặt và thiết lập thì xem trong&nbsp;<a href=\"https://blogchiasekienthuc.com/ky-nang/tien-ich-mo-rong-hoc-tieng-anh.html\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(44, 77, 209);\">bài viết này</a>&nbsp;ha !</blockquote><p><br></p><p>Bạn có thể quan sát hình bên dưới, nếu bạn muốn nghe cách phát âm chuẩn thì bạn hãy click đúp chuột vào từ mà bạn muốn nghe =&gt; rồi nghe cách mà Google phát âm.</p><p>Còn muốn dịch thì nhấn vào icon của nút Google Dịch, nhưng phần dịch thì công cụ đã có sẵn rồi nên các bạn không cần quan tâm đến nữa.</p>', 'https://blogchiasekienthuc.com/wp-content/uploads/2022/07/tu-vung-tieng-anh-cong-nghe-thong-tin.png', 0, 2, '2024-05-03 18:01:49', 2, 1),
(4, 'Ứng dụng luyện nói Tiếng Anh (Elsa Speak) có hiệu quả không?', '<p>Vâng, ứng dụng học tiếng Anh thì có rất nhiều, và ở trong bài viết trước mình cũng đã liệt kê ra những&nbsp;<a href=\"https://blogchiasekienthuc.com/ky-nang/ung-dung-hoc-tieng-anh-tot-nhat.html\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(44, 77, 209);\">ứng dụng học tiếng anh tốt nhất</a>&nbsp;hiện nay rồi.</p><p>Thế nhưng, mỗi ứng dụng tiếng anh lại có một điểm mạnh riêng, ứng dụng thì thiên về nghe, ứng dụng thì thiên về ngữ pháp, ứng dụng thì thiên về từ vựng…</p><p>Và ở trong khuôn khổ bài viết này mình chỉ tập trung vào ứng dụng luyện phát âm Tiếng Anh thôi các bạn ha.</p><p>Hiện tại, trên thị trường hiện nay có rất nhiều ứng dụng luyện nói Tiếng anh, tuy nhiên ứng dụng được đánh giá cao nhất vẫn là Elsa Speak.</p><p><strong>ELSA</strong>&nbsp;(English Language Speech Assistant) là một ứng dụng luyện tập phát âm tiếng Anh có sử dụng công nghệ A.I nhận diện giọng nói độc quyền (đứng TOP 5 thế giới), giúp ngược học rèn luyện đầy đủ các kỹ năng phát âm tiếng Anh của mình.</p><p>Công nghệ AI mà ELSA sử dụng có khả năng chỉ ra lỗi sai trong từng âm tiết, sau đó đưa ra các nhận xét và hướng dẫn để người học phát âm một cách chính xác hơn.</p><p>Không những thế, ELSA còn cung cấp các đoạn hội thoại thực tế giữa những người bản xứ với nhau, ngoài ra còn có các đoạn video hướng dẫn cách đặt môi, lưỡi, giúp người học tiến bộ nhanh chóng hơn mỗi ngày.</p><h3><strong>#1. Ứng dụng Elsa Speak có ưu điểm gì?</strong></h3><ul><li>Giao diện được thiết kế rất bắt mắt và dễ dùng.</li><li>Hỗ trợ luyện phát âm tiếng anh chính xác đền từng âm tiết.</li><li>Elsa đưa ra lộ trình học tập cho từng cá nhân, được thiết kế phù hợp cho mọi trình độ.</li><li>Nội dung bài học được Elsa cập nhật liên tục.</li><li>Elsa sẽ “chấm điểm bản xứ” chỉ ra lỗi sai khi phát âm và hướng dẫn cách sửa lỗi.</li><li>Elsa hỗ trợ bộ từ điển phát âm độc đáo, chuyên dụng cho việc học nói &amp; giao tiếp.</li><li>Bạn có thể học ở bất cứ đâu, bất cứ khi nào khi rảnh rỗi, học với nhiều chủ đề phong phú.</li><li>Tiết kiệm chi phí học tập, rẻ hơn rất nhiều so với việc học ở trung tâm hoặc thuê gia sư, và quan trọng là thời gian học không giới hạn.</li></ul><p>Elsa Speak đã thiết kế sẵn hơn 5.000 bài học luyện nói tiếng Anh, hơn 200 chủ đề, và hơn 25.000 bài luyện tập.. với đầy đủ các kỹ năng nói, bao gồm phát âm, nhấn âm và ngữ điệu.</p><h3><strong>#2. Nhược điểm&nbsp;của Elsa là gì?</strong></h3><p>Về phương pháp học thì không có gì để chê cả. Thế nhưng về cách chấm điểm của Elsa thì mình thấy chưa thực sự chuẩn lắm.</p><p>Cụ thể là khi phát âm cả câu, nếu bạn đọc chậm, đọc rõ từng từ từng chữ, tách nhau ra thì điểm số Native Speaker thường sẽ cao hơn.</p><p>Nhưng điều này lại không đúng với thực tế, bạn để ý sẽ thấy, người bản xứ người ta thường đọc nối âm là chính.</p>', 'https://blogchiasekienthuc.com/wp-content/uploads/2023/09/phan-mem-luyen-phat-am-elsa-speak.png', 0, 2, '2024-05-03 18:02:57', 3, 1),
(5, 'Cách căn giữa nội dung mà không cần gộp ô trong Excel', '<p>Làm thế nào để căn giữa nội dung mà không cần phải gộp ô trong Excel?</p><p>Vâng, thông thường thì khi cần căn giữa tiêu đề hoặc nội dung trong Excel thì chúng ta sẽ sử dụng tính năng Merge &amp; Center như hình dưới.</p><p>Tuy nhiên, nếu làm như vậy thì đôi khi sẽ khó khăn trong việc lọc dữ liệu, ẩn công thức ở trong ô đó, hoặc mất dữ liệu ở trong ô mà chúng ta đã viết trước đó rồi..</p><p>Chính vì thế mà trong bài viết này mình sẽ chia sẻ với các bạn một mẹo nhỏ giúp căn giữa nội dung mà không cần phải gộp ô.</p><p class=\"ql-align-center\"><br></p><h3><strong>Cách căn giữa nội dung mà không cần gộp ô</strong></h3><p><strong>Bước 1.</strong>&nbsp;Bạn cũng bôi gộp như hình bên dưới =&gt; sau đó nhấn tổ hợp phím&nbsp;<code style=\"color: rgb(34, 38, 34); background-color: rgba(242, 255, 255, 0.45);\">CTRL + F1</code>&nbsp;hoặc nhấn chuột phải chọn&nbsp;<code style=\"color: rgb(34, 38, 34); background-color: rgba(242, 255, 255, 0.45);\">Format Cells</code></p><p><a href=\"https://blogchiasekienthuc.com/wp-content/uploads/2023/05/cach-can-giua-noi-dung-khong-can-gop-o-1.png\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(44, 77, 209);\"><img src=\"https://blogchiasekienthuc.com/wp-content/uploads/2023/05/cach-can-giua-noi-dung-khong-can-gop-o-1.png\" alt=\"cach-can-giua-noi-dung-khong-can-gop-o (1)\" height=\"715\" width=\"1200\"></a></p><p><strong>Bước 2.</strong>&nbsp;Chuyển sang tab&nbsp;<code style=\"color: rgb(34, 38, 34); background-color: rgba(242, 255, 255, 0.45);\">Alighnment</code>&nbsp;=&gt; rồi thiết lập:</p><ul><li><strong>Hirizontal:&nbsp;</strong><code style=\"color: rgb(34, 38, 34); background-color: rgba(242, 255, 255, 0.45);\">Center Across Selection</code>&nbsp;rồi bấm OK là xong !</li></ul><iframe class=\"ql-video ql-align-center\" frameborder=\"0\" allowfullscreen=\"true\" src=\"https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-3021688763784412&amp;output=html&amp;h=280&amp;adk=687003611&amp;adf=3861768076&amp;w=574&amp;abgtt=6&amp;fwrn=4&amp;fwrnh=100&amp;lmt=1714729528&amp;num_ads=1&amp;rafmt=1&amp;armr=3&amp;sem=mc&amp;pwprc=1597238652&amp;ad_type=text_image&amp;format=574x280&amp;url=https%3A%2F%2Fblogchiasekienthuc.com%2Fhoc-office%2Fcach-can-giua-noi-dung-ma-khong-can-gop-o-trong-excel.html&amp;fwr=0&amp;pra=3&amp;rh=144&amp;rw=574&amp;rpe=1&amp;resp_fmts=3&amp;wgl=1&amp;fa=27&amp;uach=WyJXaW5kb3dzIiwiMTUuMC4wIiwieDg2IiwiIiwiMTI0LjAuNjM2Ny4xMTkiLG51bGwsMCxudWxsLCI2NCIsW1siQ2hyb21pdW0iLCIxMjQuMC42MzY3LjExOSJdLFsiR29vZ2xlIENocm9tZSIsIjEyNC4wLjYzNjcuMTE5Il0sWyJOb3QtQS5CcmFuZCIsIjk5LjAuMC4wIl1dLDBd&amp;dt=1714734209838&amp;bpp=1&amp;bdt=954&amp;idt=-M&amp;shv=r20240501&amp;mjsv=m202404300101&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3D4cfb8941d7b3ed54%3AT%3D1714733561%3ART%3D1714734199%3AS%3DALNI_MYhozkGdhyCvo6Urzg9ssNTw4PcJA&amp;gpic=UID%3D00000e07e8cf2555%3AT%3D1714733561%3ART%3D1714734199%3AS%3DALNI_MbCCVi0SWKOCF6URLwNf5sHI8ouLA&amp;eo_id_str=ID%3D8cc0dddbfcd86423%3AT%3D1714733561%3ART%3D1714734199%3AS%3DAA-AfjbQslaPEHO7rXVzbCxZerWd&amp;prev_fmts=0x0%2C592x148%2C592x280%2C262x600%2C592x148%2C262x600&amp;nras=2&amp;correlator=3287504120914&amp;frm=20&amp;pv=1&amp;ga_vid=1554363743.1714733561&amp;ga_sid=1714734209&amp;ga_hid=871401078&amp;ga_fc=1&amp;ga_cid=167118462.1714733561&amp;u_tz=420&amp;u_his=1&amp;u_h=1920&amp;u_w=1080&amp;u_ah=1920&amp;u_aw=1080&amp;u_cd=24&amp;u_sd=1&amp;dmc=8&amp;adx=118&amp;ady=2324&amp;biw=1063&amp;bih=1831&amp;scr_x=0&amp;scr_y=0&amp;eid=44759876%2C44759927%2C44759842%2C95331696%2C95331982%2C95330888%2C31082143%2C95331042%2C31078663%2C31078665%2C31078668%2C31078670&amp;oid=2&amp;pvsid=2328079183531503&amp;tmod=1076351485&amp;uas=0&amp;nvt=1&amp;ref=https%3A%2F%2Fblogchiasekienthuc.com%2Fhoc-office&amp;fc=1408&amp;brdim=1920%2C-840%2C1920%2C-840%2C1080%2C-840%2C1080%2C1920%2C1080%2C1831&amp;vis=1&amp;rsz=%7C%7Cs%7C&amp;abl=NS&amp;fu=128&amp;bc=31&amp;bz=1&amp;td=1&amp;psd=W251bGwsbnVsbCxudWxsLDNd&amp;nt=1&amp;ifi=7&amp;uci=a!7&amp;btvi=3&amp;fsb=1&amp;dtd=3\" height=\"0\" width=\"574\"></iframe><ul><li class=\"ql-align-center\"><br></li><li><strong>Vertica:</strong>&nbsp;<code style=\"color: rgb(34, 38, 34); background-color: rgba(242, 255, 255, 0.45);\">Center</code></li></ul><p><a href=\"https://blogchiasekienthuc.com/wp-content/uploads/2023/05/cach-can-giua-noi-dung-khong-can-gop-o-2.png\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(44, 77, 209);\"><img src=\"https://blogchiasekienthuc.com/wp-content/uploads/2023/05/cach-can-giua-noi-dung-khong-can-gop-o-2.png\" alt=\"cach-can-giua-noi-dung-khong-can-gop-o (2)\" height=\"769\" width=\"1200\"></a></p><p><strong>Bước 3.</strong>&nbsp;Không có bước 3, vậy là xong rồi đấy &gt;.&lt;</p><h3><strong>Lời Kết</strong></h3><iframe class=\"ql-video ql-align-center\" frameborder=\"0\" allowfullscreen=\"true\" src=\"https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-3021688763784412&amp;output=html&amp;h=280&amp;adk=279511765&amp;adf=3647433178&amp;w=592&amp;abgtt=6&amp;fwrn=4&amp;fwrnh=100&amp;lmt=1714729528&amp;num_ads=1&amp;rafmt=1&amp;armr=3&amp;sem=mc&amp;pwprc=1597238652&amp;ad_type=text_image&amp;format=592x280&amp;url=https%3A%2F%2Fblogchiasekienthuc.com%2Fhoc-office%2Fcach-can-giua-noi-dung-ma-khong-can-gop-o-trong-excel.html&amp;fwr=0&amp;pra=3&amp;rh=148&amp;rw=592&amp;rpe=1&amp;resp_fmts=3&amp;wgl=1&amp;fa=27&amp;uach=WyJXaW5kb3dzIiwiMTUuMC4wIiwieDg2IiwiIiwiMTI0LjAuNjM2Ny4xMTkiLG51bGwsMCxudWxsLCI2NCIsW1siQ2hyb21pdW0iLCIxMjQuMC42MzY3LjExOSJdLFsiR29vZ2xlIENocm9tZSIsIjEyNC4wLjYzNjcuMTE5Il0sWyJOb3QtQS5CcmFuZCIsIjk5LjAuMC4wIl1dLDBd&amp;dt=1714734209838&amp;bpp=1&amp;bdt=954&amp;idt=-M&amp;shv=r20240501&amp;mjsv=m202404300101&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3D4cfb8941d7b3ed54%3AT%3D1714733561%3ART%3D1714734199%3AS%3DALNI_MYhozkGdhyCvo6Urzg9ssNTw4PcJA&amp;gpic=UID%3D00000e07e8cf2555%3AT%3D1714733561%3ART%3D1714734199%3AS%3DALNI_MbCCVi0SWKOCF6URLwNf5sHI8ouLA&amp;eo_id_str=ID%3D8cc0dddbfcd86423%3AT%3D1714733561%3ART%3D1714734199%3AS%3DAA-AfjbQslaPEHO7rXVzbCxZerWd&amp;prev_fmts=0x0%2C592x148%2C592x280%2C262x600%2C592x148%2C262x600%2C574x280&amp;nras=3&amp;correlator=3287504120914&amp;frm=20&amp;pv=1&amp;ga_vid=1554363743.1714733561&amp;ga_sid=1714734209&amp;ga_hid=871401078&amp;ga_fc=1&amp;ga_cid=167118462.1714733561&amp;u_tz=420&amp;u_his=1&amp;u_h=1920&amp;u_w=1080&amp;u_ah=1920&amp;u_aw=1080&amp;u_cd=24&amp;u_sd=1&amp;dmc=8&amp;adx=100&amp;ady=3183&amp;biw=1063&amp;bih=1831&amp;scr_x=0&amp;scr_y=0&amp;eid=44759876%2C44759927%2C44759842%2C95331696%2C95331982%2C95330888%2C31082143%2C95331042%2C31078663%2C31078665%2C31078668%2C31078670&amp;oid=2&amp;pvsid=2328079183531503&amp;tmod=1076351485&amp;uas=0&amp;nvt=1&amp;ref=https%3A%2F%2Fblogchiasekienthuc.com%2Fhoc-office&amp;fc=1408&amp;brdim=1920%2C-840%2C1920%2C-840%2C1080%2C-840%2C1080%2C1920%2C1080%2C1831&amp;vis=1&amp;rsz=%7C%7Cs%7C&amp;abl=NS&amp;fu=128&amp;bc=31&amp;bz=1&amp;td=1&amp;psd=W251bGwsbnVsbCxudWxsLDNd&amp;nt=1&amp;ifi=8&amp;uci=a!8&amp;btvi=4&amp;fsb=1&amp;dtd=6\" height=\"0\" width=\"592\"></iframe><p class=\"ql-align-center\"><br></p><p>Vâng, đây là một mẹo nhỏ giúp bạn căn giữa nội dung mà không cần phải gộp ô trong Excel, sẽ rất hữu ích trong quá trình làm việc của bạn đó.</p><iframe class=\"ql-video ql-align-center\" frameborder=\"0\" allowfullscreen=\"true\" src=\"https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-3021688763784412&amp;output=html&amp;h=148&amp;slotname=1579230080&amp;adk=952028706&amp;adf=3656194963&amp;pi=t.ma~as.1579230080&amp;w=592&amp;abgtt=6&amp;fwrn=4&amp;lmt=1714729528&amp;rafmt=11&amp;format=592x148&amp;url=https%3A%2F%2Fblogchiasekienthuc.com%2Fhoc-office%2Fcach-can-giua-noi-dung-ma-khong-can-gop-o-trong-excel.html&amp;wgl=1&amp;uach=WyJXaW5kb3dzIiwiMTUuMC4wIiwieDg2IiwiIiwiMTI0LjAuNjM2Ny4xMTkiLG51bGwsMCxudWxsLCI2NCIsW1siQ2hyb21pdW0iLCIxMjQuMC42MzY3LjExOSJdLFsiR29vZ2xlIENocm9tZSIsIjEyNC4wLjYzNjcuMTE5Il0sWyJOb3QtQS5CcmFuZCIsIjk5LjAuMC4wIl1dLDBd&amp;dt=1714734209081&amp;bpp=1&amp;bdt=197&amp;idt=232&amp;shv=r20240501&amp;mjsv=m202404300101&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3D4cfb8941d7b3ed54%3AT%3D1714733561%3ART%3D1714734199%3AS%3DALNI_MYhozkGdhyCvo6Urzg9ssNTw4PcJA&amp;gpic=UID%3D00000e07e8cf2555%3AT%3D1714733561%3ART%3D1714734199%3AS%3DALNI_MbCCVi0SWKOCF6URLwNf5sHI8ouLA&amp;eo_id_str=ID%3D8cc0dddbfcd86423%3AT%3D1714733561%3ART%3D1714734199%3AS%3DAA-AfjbQslaPEHO7rXVzbCxZerWd&amp;prev_fmts=0x0%2C592x148%2C592x280%2C262x600&amp;nras=1&amp;correlator=3287504120914&amp;frm=20&amp;pv=1&amp;ga_vid=1554363743.1714733561&amp;ga_sid=1714734209&amp;ga_hid=871401078&amp;ga_fc=1&amp;ga_cid=167118462.1714733561&amp;rplot=4&amp;u_tz=420&amp;u_his=1&amp;u_h=1920&amp;u_w=1080&amp;u_ah=1920&amp;u_aw=1080&amp;u_cd=24&amp;u_sd=1&amp;dmc=8&amp;adx=100&amp;ady=3256&amp;biw=1063&amp;bih=1831&amp;scr_x=0&amp;scr_y=0&amp;eid=44759876%2C44759927%2C44759842%2C95331696%2C95331982%2C95330888%2C31082143%2C95331042%2C31078663%2C31078665%2C31078668%2C31078670&amp;oid=2&amp;pvsid=2328079183531503&amp;tmod=1076351485&amp;uas=0&amp;nvt=1&amp;ref=https%3A%2F%2Fblogchiasekienthuc.com%2Fhoc-office&amp;fc=1920&amp;brdim=0%2C0%2C0%2C0%2C1080%2C-840%2C0%2C0%2C1080%2C1831&amp;vis=1&amp;rsz=%7C%7CEebr%7C&amp;abl=CS&amp;pfx=0&amp;fu=128&amp;bc=31&amp;bz=0&amp;td=1&amp;psd=W251bGwsbnVsbCxudWxsLDNd&amp;nt=1&amp;ifi=4&amp;uci=a!4&amp;btvi=1&amp;fsb=1&amp;dtd=461\" height=\"0\" width=\"592\"></iframe><p class=\"ql-align-center\"><br></p><p>Vậy nên hãy note lại thủ thuật này để sử dụng khi cần nhé, chúc các bạn thành công !</p>', 'https://blogchiasekienthuc.com/wp-content/uploads/2023/05/cach-can-giua-noi-dung-khong-can-gop-o.png', 0, 3, '2024-05-03 18:04:03', 2, 1),
(6, 'Python đã được tích hợp thẳng vào Excel (thực sự mạnh)', '<p>Theo nguồn tin từ Microsoft thì ban đầu&nbsp;<a href=\"https://blogchiasekienthuc.com/hoc-office/python-trong-excel.html#\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(44, 77, 209);\">&nbsp;Python</a>&nbsp;trong Excel sẽ được triển khai trên hệ điều hành Windows trước (kể từ phiên bản 16.0.16818.20000), sau đó sẽ mở rộng sang các nền tảng khác sau.</p><p>Mà các bạn biết đấy,&nbsp;<a href=\"https://blogchiasekienthuc.com/thu-thuat-hay/cach-cai-dat-python-tren-windows.html\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(44, 77, 209);\">Python</a>&nbsp;là một trong&nbsp;<a href=\"https://blogchiasekienthuc.com/thu-thuat-hay/top-5-ngon-ngu-lap-trinh-nen-hoc.html\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(44, 77, 209);\">những ngôn ngữ lập trình phổ biến</a>&nbsp;nhất hiện nay, nó rất “được lòng” các doanh nghiệp và người dùng cá nhân, vậy nên số lượng người dùng đang không ngừng tăng lên mỗi ngày.</p><p>Trước đây, để thực hiện các công việc phức tạp trên Excel, ví dụ như phân tích dữ liệu thì người dùng sẽ sử dụng VBA, thế nhưng giờ đây khi có&nbsp;<a href=\"https://blogchiasekienthuc.com/hoc-office/python-trong-excel.html#\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(44, 77, 209);\">&nbsp;Python</a>&nbsp;rồi thì VBA có lẽ sẽ sớm trở thành quá khứ.</p><p>Bạn có thể dễ dàng phân tích dữ liệu trong Excel bằng cách sử dụng các biểu đồ và thư viện&nbsp;<a href=\"https://blogchiasekienthuc.com/hoc-office/python-trong-excel.html#\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(44, 77, 209);\">&nbsp;Python</a>, sau đó sử dụng các công thức, biểu đồ và&nbsp;<a href=\"https://blogchiasekienthuc.com/hoc-office/su-dung-pivottable-trong-excel.html\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(44, 77, 209);\">PivotTable của Excel</a>&nbsp;để tinh chỉnh/thiết lập thêm thông tin chi tiết.</p><h3><strong>#1. Python trên Excel hữu ích như thế nào?</strong></h3><iframe class=\"ql-video ql-align-center\" frameborder=\"0\" allowfullscreen=\"true\" src=\"https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-3021688763784412&amp;output=html&amp;h=280&amp;adk=279511765&amp;adf=4061037818&amp;w=592&amp;abgtt=6&amp;fwrn=4&amp;fwrnh=100&amp;lmt=1714723246&amp;num_ads=1&amp;rafmt=1&amp;armr=3&amp;sem=mc&amp;pwprc=1597238652&amp;ad_type=text_image&amp;format=592x280&amp;url=https%3A%2F%2Fblogchiasekienthuc.com%2Fhoc-office%2Fpython-trong-excel.html&amp;fwr=0&amp;pra=3&amp;rh=148&amp;rw=592&amp;rpe=1&amp;resp_fmts=3&amp;wgl=1&amp;fa=27&amp;uach=WyJXaW5kb3dzIiwiMTUuMC4wIiwieDg2IiwiIiwiMTI0LjAuNjM2Ny4xMTkiLG51bGwsMCxudWxsLCI2NCIsW1siQ2hyb21pdW0iLCIxMjQuMC42MzY3LjExOSJdLFsiR29vZ2xlIENocm9tZSIsIjEyNC4wLjYzNjcuMTE5Il0sWyJOb3QtQS5CcmFuZCIsIjk5LjAuMC4wIl1dLDBd&amp;dt=1714734671800&amp;bpp=1&amp;bdt=780&amp;idt=-M&amp;shv=r20240501&amp;mjsv=m202404300101&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3D4cfb8941d7b3ed54%3AT%3D1714733561%3ART%3D1714734671%3AS%3DALNI_MYhozkGdhyCvo6Urzg9ssNTw4PcJA&amp;gpic=UID%3D00000e07e8cf2555%3AT%3D1714733561%3ART%3D1714734671%3AS%3DALNI_MbCCVi0SWKOCF6URLwNf5sHI8ouLA&amp;eo_id_str=ID%3D8cc0dddbfcd86423%3AT%3D1714733561%3ART%3D1714734671%3AS%3DAA-AfjbQslaPEHO7rXVzbCxZerWd&amp;prev_fmts=0x0%2C592x148%2C592x280%2C592x148%2C586x280%2C262x600%2C262x600&amp;nras=2&amp;correlator=5100937019575&amp;frm=20&amp;pv=1&amp;ga_vid=167118462.1714733561&amp;ga_sid=1714734671&amp;ga_hid=1128469927&amp;ga_fc=1&amp;ga_cid=1554363743.1714733561&amp;u_tz=420&amp;u_his=9&amp;u_h=1920&amp;u_w=1080&amp;u_ah=1920&amp;u_aw=1080&amp;u_cd=24&amp;u_sd=1&amp;dmc=8&amp;adx=100&amp;ady=2496&amp;biw=1063&amp;bih=1831&amp;scr_x=0&amp;scr_y=0&amp;eid=44759876%2C44759927%2C44759842%2C95329725%2C95331696%2C95331982%2C95331036%2C95331042%2C31078663%2C31078665%2C31078668%2C31078670&amp;oid=2&amp;psts=AOrYGslQ0sXxgPr1y9kNaxuge3JGmaIWu_FdTFkrtgZZlTR9qqyij0h1_s32xJZhixU7lqHNe8twvqmc2nxB0m8Tc1AUSxw&amp;pvsid=3865516558823729&amp;tmod=1076351485&amp;uas=0&amp;nvt=1&amp;ref=https%3A%2F%2Fblogchiasekienthuc.com%2Fhoc-office&amp;fc=1408&amp;brdim=1920%2C-840%2C1920%2C-840%2C1080%2C-840%2C1080%2C1920%2C1080%2C1831&amp;vis=1&amp;rsz=%7C%7Cs%7C&amp;abl=NS&amp;fu=128&amp;bc=31&amp;bz=1&amp;td=1&amp;psd=W251bGwsbnVsbCxudWxsLDNd&amp;nt=1&amp;ifi=8&amp;uci=a!8&amp;btvi=4&amp;fsb=1&amp;dtd=5\" height=\"0\" width=\"592\"></iframe><p class=\"ql-align-center\"><br></p><p><strong>1.1. Hỗ trợ làm việc liền mạch hơn:</strong>&nbsp;Rõ ràng rồi, bây giờ bạn có thể thực hiện phân tích dữ liệu nâng cao ngay trên Excel bằng cách truy cập vào&nbsp;<a href=\"https://blogchiasekienthuc.com/hoc-office/python-trong-excel.html#\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(44, 77, 209);\">&nbsp;Python</a>&nbsp;trên Excel mà không cần phải cài đặt hay thiết lập gì thêm</p><p>Thông qua các trình kết nối được tích hợp sẵn của Excel và Power Query thì bạn có thể dễ dàng đưa dữ liệu từ bên ngoài vào&nbsp;<a href=\"https://blogchiasekienthuc.com/hoc-office/python-trong-excel.html#\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(44, 77, 209);\">&nbsp;Python</a>&nbsp;khi làm việc với Excel.</p><p>Theo như Microsoft chia sẻ thì hãng đang hợp tác với Anaconda (kho lưu trữ Python cấp doanh nghiệp hàng đầu) để phân phối Anaconda cho Python chạy trong&nbsp;<a href=\"https://blogchiasekienthuc.com/thu-thuat-may-tinh/cach-tao-vps-windows-tren-microsoft-azure.html\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(44, 77, 209);\">Azure</a>… (<a href=\"https://techcommunity.microsoft.com/t5/excel-blog/announcing-python-in-excel-combining-the-power-of-python-and-the/ba-p/3893439\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(44, 77, 209);\">xem ví dụ</a>).</p><p><img src=\"https://blogchiasekienthuc.com/wp-content/uploads/2023/09/python-trong-excel-1.png\" alt=\"python-trong-excel-1\" height=\"679\" width=\"900\"></p><iframe class=\"ql-video ql-align-center\" frameborder=\"0\" allowfullscreen=\"true\" src=\"https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-3021688763784412&amp;output=html&amp;h=280&amp;adk=279511765&amp;adf=3523678161&amp;w=592&amp;abgtt=6&amp;fwrn=4&amp;fwrnh=100&amp;lmt=1714723246&amp;num_ads=1&amp;rafmt=1&amp;armr=3&amp;sem=mc&amp;pwprc=1597238652&amp;ad_type=text_image&amp;format=592x280&amp;url=https%3A%2F%2Fblogchiasekienthuc.com%2Fhoc-office%2Fpython-trong-excel.html&amp;fwr=0&amp;pra=3&amp;rh=148&amp;rw=592&amp;rpe=1&amp;resp_fmts=3&amp;wgl=1&amp;fa=27&amp;uach=WyJXaW5kb3dzIiwiMTUuMC4wIiwieDg2IiwiIiwiMTI0LjAuNjM2Ny4xMTkiLG51bGwsMCxudWxsLCI2NCIsW1siQ2hyb21pdW0iLCIxMjQuMC42MzY3LjExOSJdLFsiR29vZ2xlIENocm9tZSIsIjEyNC4wLjYzNjcuMTE5Il0sWyJOb3QtQS5CcmFuZCIsIjk5LjAuMC4wIl1dLDBd&amp;dt=1714734671800&amp;bpp=1&amp;bdt=780&amp;idt=-M&amp;shv=r20240501&amp;mjsv=m202404300101&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3D4cfb8941d7b3ed54%3AT%3D1714733561%3ART%3D1714734671%3AS%3DALNI_MYhozkGdhyCvo6Urzg9ssNTw4PcJA&amp;gpic=UID%3D00000e07e8cf2555%3AT%3D1714733561%3ART%3D1714734671%3AS%3DALNI_MbCCVi0SWKOCF6URLwNf5sHI8ouLA&amp;eo_id_str=ID%3D8cc0dddbfcd86423%3AT%3D1714733561%3ART%3D1714734671%3AS%3DAA-AfjbQslaPEHO7rXVzbCxZerWd&amp;prev_fmts=0x0%2C592x148%2C592x280%2C592x148%2C586x280%2C262x600%2C262x600%2C592x280&amp;nras=3&amp;correlator=5100937019575&amp;frm=20&amp;pv=1&amp;ga_vid=167118462.1714733561&amp;ga_sid=1714734671&amp;ga_hid=1128469927&amp;ga_fc=1&amp;ga_cid=1554363743.1714733561&amp;u_tz=420&amp;u_his=9&amp;u_h=1920&amp;u_w=1080&amp;u_ah=1920&amp;u_aw=1080&amp;u_cd=24&amp;u_sd=1&amp;dmc=8&amp;adx=100&amp;ady=3633&amp;biw=1063&amp;bih=1831&amp;scr_x=0&amp;scr_y=0&amp;eid=44759876%2C44759927%2C44759842%2C95329725%2C95331696%2C95331982%2C95331036%2C95331042%2C31078663%2C31078665%2C31078668%2C31078670&amp;oid=2&amp;psts=AOrYGslQ0sXxgPr1y9kNaxuge3JGmaIWu_FdTFkrtgZZlTR9qqyij0h1_s32xJZhixU7lqHNe8twvqmc2nxB0m8Tc1AUSxw&amp;pvsid=3865516558823729&amp;tmod=1076351485&amp;uas=0&amp;nvt=1&amp;ref=https%3A%2F%2Fblogchiasekienthuc.com%2Fhoc-office&amp;fc=1408&amp;brdim=1920%2C-840%2C1920%2C-840%2C1080%2C-840%2C1080%2C1920%2C1080%2C1831&amp;vis=1&amp;rsz=%7C%7Cs%7C&amp;abl=NS&amp;fu=128&amp;bc=31&amp;bz=1&amp;td=1&amp;psd=W251bGwsbnVsbCxudWxsLDNd&amp;nt=1&amp;ifi=9&amp;uci=a!9&amp;btvi=5&amp;fsb=1&amp;dtd=8\" height=\"0\" width=\"592\"></iframe><p class=\"ql-align-center\"><br></p><p><strong>1.2. Hỗ trợ làm việc theo Team:</strong>&nbsp;Bạn có thể cùng làm việc với team thông qua Microsoft Teams và Microsoft Outlook.</p><p>Bạn có thể để lại nhận xét, hoặc tag thành viên (@), ngoài ra thì đồng đội của bạn có thể làm mới Excel để cập nhật thông tin mới nhất ngay cả khi họ chưa kích hoạt&nbsp;<a href=\"https://blogchiasekienthuc.com/hoc-office/python-trong-excel.html#\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(44, 77, 209);\">&nbsp;Python</a>&nbsp;trong Excel.</p><p><br></p><p class=\"ql-align-center\"><br></p>', 'https://blogchiasekienthuc.com/wp-content/uploads/2023/09/python-trong-excel.png', 0, 3, '2024-05-03 18:11:55', 2, 1);

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
(2, 3, 1),
(3, 3, 1),
(4, 2, 2),
(8, 2, 5),
(9, 3, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `ID` int NOT NULL,
  `Name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Password` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Role` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`ID`, `Name`, `Username`, `Password`, `Role`) VALUES
(2, 'Khôi Nguyên', 'khnguyen', '$2y$10$E1JaM6tznEkiXpxbWcaiauAlkExQ.obsX5uJsEpQZ5BbwJokpLscu', 0),
(3, 'ADMIN', 'admin', '$2y$10$nPB9P7cirz8qEaKdEwfiV.kc7euWZxe9nBfua1q65iZ7tFzF.WvJi', 2),
(4, 'AUTHOR', 'author', '$2y$10$sH6ZUv/2L4O8t1U4.KpliebVheW0xMQWlTkNKks7eeQZlw8bM3trW', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `blogs_users` (`userID`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `comments_users` (`userID`),
  ADD KEY `comments_blogs` (`blogID`),
  ADD KEY `comments_comments` (`parentCommentID`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `new__author` (`author_id`),
  ADD KEY `new__category` (`category_id`);

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
-- AUTO_INCREMENT cho bảng `author`
--
ALTER TABLE `author`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `blogs`
--
ALTER TABLE `blogs`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `syn_blogs_categories`
--
ALTER TABLE `syn_blogs_categories`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_users` FOREIGN KEY (`userID`) REFERENCES `users` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_blogs` FOREIGN KEY (`blogID`) REFERENCES `blogs` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `comments_comments` FOREIGN KEY (`parentCommentID`) REFERENCES `comments` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `comments_users` FOREIGN KEY (`userID`) REFERENCES `users` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `new__author` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`),
  ADD CONSTRAINT `new__category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

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
