-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2023 at 07:20 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codingwizard`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(50) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_num` int(50) NOT NULL,
  `msg` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_nopad_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone_num`, `msg`) VALUES
(1, 'anshul', 'abc@abc.com', 1234567890, 'lorem ipsum'),
(2, 'hari', 'gajodhar@gmail.com', 958965863, 'dsadas'),
(4, 'Anshul Rajesh Dhamankar', 'dhamankaranshul@gmail.com', 2147483647, 'hi'),
(5, 'Anshul Rajesh Dhamankar', 'dhamankaranshul@gmail.com', 2147483647, 'hi'),
(6, 'Anshul Rajesh Dhamankar', 'dhamankaranshul@gmail.com', 2147483647, 'hi'),
(7, 'Anshul Rajesh Dhamankar', 'dhamankaranshul@gmail.com', 2147483647, ''),
(8, 'Anshul Rajesh Dhamankar', 'dhamankaranshul@gmail.com', 2147483647, 'nm '),
(9, 'ans', 'anshuldhamankar01@gmail.com', 2147483647, 'dsadjiasod\r\n'),
(10, 'MIT ADT UNIVERSITY', 'anshul.r.dhamankar2004@gmail.com', 2147483647, 'sdadsa'),
(11, 'da', 'anshul@gmail.com', 702080, 'dasa'),
(12, 'da', 'anshul@gmail.com', 702080, 'dasa'),
(13, 'da', 'anshul@gmail.com', 702080, 'dasa'),
(14, 'ashwya', 'ashwya@gmail.com', 2147483647, 'dasas'),
(15, 'ashwya', 'ashwya@gmail.com', 2147483647, 'sad');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(100) NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `slug` varchar(30) NOT NULL,
  `subtitle` varchar(1000) NOT NULL,
  `img_file` varchar(12) NOT NULL,
  `Link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_nopad_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `content`, `date`, `slug`, `subtitle`, `img_file`, `Link`) VALUES
(1, '\"Welcome to My Blog Site: Exploring the Journey of Personal Projects\"\n\n', 'Hello and a warm welcome to my blog site! I\'m thrilled to have you here as we embark on a journey of exploration and discovery. This digital space is not just a collection of web pages; it\'s a canvas where I share my passion for technology and innovation through personal projects.\n\nWhy This Blog:\nThis blog is a reflection of my dedication to creativity, problem-solving, and the ever-evolving world of technology. Each post you find here is a piece of me—crafted with enthusiasm, fueled by curiosity, and driven by the desire to share my journey with like-minded individuals.\n\nA Personal Touch:\nConsider this blog as an open invitation into the world of my personal projects. Whether it\'s coding adventures, AI experiments, or innovative solutions, I\'m excited to share the behind-the-scenes stories, challenges faced, and lessons learned along the way.\n\nWhy Personal Projects Matter:\nPersonal projects are more than just lines of code or digital designs; they represent a journey of growth and learning. Through this blog, I aim to not only showcase the end results but also to provide a glimpse into the process—because the journey is just as important as the destination.\n\nGreeting to Visitors:\nTo all the curious minds, tech enthusiasts, and fellow creators who have found their way here, welcome! Your presence adds a layer of vibrancy to this digital space. Feel free to explore, ask questions, and join the conversation. This blog is a collaborative space where ideas flourish, and discussions spark innovation.\n\nWhat to Expect:\nIn the upcoming posts, anticipate a diverse range of content—from in-depth project breakdowns and tech tutorials to reflections on the tech landscape. As we navigate through the realm of personal projects, I invite you to share your thoughts, insights, and project stories in the comments.\n\nThank you for being a part of this exciting beginning. Let\'s make this blog a hub of inspiration, knowledge-sharing, and celebration of the wonderful world of technology.\n\nWelcome to my blog, and here\'s to the thrilling journey ahead!\n\nBest regards,\nAnshul Dhamankar', '2023-12-24 22:37:03', 'first-post', 'Embark on a Discovery of Passion-Driven Creations\n\n', 'welcome.jpg', ''),
(2, 'ECHO- AI BASED VIRTUAL ASSISTANT', 'Introduction:\r\nIn the realm of technology, a personal touch to digital interactions is a refreshing concept. Enter Echo, your very own AI assistant, designed and created by Anshul Dhamankar. Echo is not just a voice; it\'s a versatile companion ready to assist you with a myriad of tasks and add a touch of humor to your day.\r\n\r\nFeatures:\r\nVoice Recognition: Echo is equipped with state-of-the-art speech recognition, making interactions seamless and natural.\r\nWeb Interaction: It can open websites, perform searches on Google, Wikipedia, and even play your favorite music on Spotify or YouTube.\r\nAI-powered Responses: Echo delves into the power of artificial intelligence, generating creative responses and even images using OpenAI.\r\nUtility Functions: From fetching the latest news and weather updates to answering complex mathematical queries, Echo is your go-to for utility tasks.\r\nEntertainment: Need a joke to lighten the mood? Echo has a knack for humor and can share a chuckle with you.\r\nPersonalization:\r\nEcho goes beyond mere functionality; it\'s designed to understand and adapt to your preferences. Whether you want to know the weather, play a song, or simply chat, Echo\'s got your back.\r\n\r\nThe Developer\'s Touch:\r\nAnshul Dhamankar, the mind behind Echo, has crafted a virtual assistant that not only performs tasks efficiently but also adds a personal touch. From the choice of jokes to the witty responses, Echo reflects the developer\'s creativity and dedication.\r\n\r\nHow to Interact:\r\nInitiate Conversation: Start by saying \"Hi\" or any of the friendly greetings, and Echo will respond in kind.\r\nTask Commands: Instruct Echo to perform tasks like opening websites, searching the web, or even generating passwords.\r\nAI Conversations: Unleash the power of AI by prompting Echo with questions or asking for creative responses.\r\nEntertainment: For a good laugh, ask Echo to tell you a joke.\r\n\r\nConclusion:\r\nEcho is more than just a program; it\'s a glimpse into the future of personalized AI interactions. Anshul Dhamankar\'s creation showcases the potential for technology to not only simplify our lives but also bring joy and amusement.', '2023-12-26 20:10:09', 'second-post', 'Your Personal AI Assistant: Meet Echo, the Virtual Companion.', 'VA.jpg', 'https://github.com/anshuldhamankar2004/VA'),
(3, 'HR Analytics On Employee Attrition.', 'In the early stages of my HR analytics project focused on employee attrition using IBM\'s rich dataset, I have embarked on a journey of exploratory data analysis (EDA) to glean initial insights before delving into the intricacies of data modeling. The dataset offers a comprehensive view of employee demographics, job roles, and satisfaction scores, among other factors. While I haven\'t yet conducted formal data modeling, my preliminary examination has raised intriguing questions. I\'ve begun to explore the distribution of demographic characteristics, satisfaction levels, and potential correlations with attrition. Early observations may hint at patterns such as varying satisfaction scores across departments or potential links between work-life balance and turnover. These insights lay the foundation for more in-depth analyses, signaling the exciting possibilities that lie ahead as I progress towards developing predictive models to better understand and mitigate employee attrition within organizational contexts.', '2023-12-25 22:25:08', 'third-post', 'A Data Analysis Project on HR Analytics Employee Attrition', '', ''),
(8, 'new posr', 'hi', '2023-12-26 23:12:24', 'hello', 'post 4', '4.jpg', 'abc.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`),
  ADD UNIQUE KEY `subtitle` (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
