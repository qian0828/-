/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80036 (8.0.36)
 Source Host           : localhost:3306
 Source Schema         : xianzhuan

 Target Server Type    : MySQL
 Target Server Version : 80036 (8.0.36)
 File Encoding         : 65001

 Date: 24/07/2025 21:14:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `recipient` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_default` tinyint(1) NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of addresses
-- ----------------------------
INSERT INTO `addresses` VALUES (1, 1, 'Alice', '13800000001', '北京市海淀区中关村大街1号', 0, '2025-07-17 09:13:29');
INSERT INTO `addresses` VALUES (2, 2, 'Bob', '13800000002', '上海市徐汇区漕溪北路78号', 1, '2025-07-17 09:13:29');
INSERT INTO `addresses` VALUES (3, 3, 'Charlie', '13800000003', '广州市天河区体育东路100号', 1, '2025-07-17 09:13:29');
INSERT INTO `addresses` VALUES (4, 1, 'Alice', '13800000121', '北京市朝阳区望京街道10号', 1, '2025-07-17 09:13:29');
INSERT INTO `addresses` VALUES (10, 1, 'hhh', '12345678901', 'nku', 0, '2025-07-24 20:21:33');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` int NULL DEFAULT 1,
  `added_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `item_id`(`item_id` ASC) USING BTREE,
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (2, 1, 3, 2, '2025-07-17 09:13:29');
INSERT INTO `cart` VALUES (4, 3, 5, 1, '2025-07-17 09:13:29');
INSERT INTO `cart` VALUES (5, 3, 7, 3, '2025-07-17 09:13:29');
INSERT INTO `cart` VALUES (17, 2, 4, 1, '2025-07-20 13:45:11');
INSERT INTO `cart` VALUES (18, 2, 3, 1, '2025-07-21 14:56:42');
INSERT INTO `cart` VALUES (20, 2, 9, 1, '2025-07-22 16:18:19');
INSERT INTO `cart` VALUES (21, 5, 8, 1, '2025-07-22 16:52:18');
INSERT INTO `cart` VALUES (23, 1, 5, 1, '2025-07-23 19:12:32');
INSERT INTO `cart` VALUES (24, 2, 2, 1, '2025-07-24 11:19:55');
INSERT INTO `cart` VALUES (26, 3, 8, 1, '2025-07-24 18:45:05');
INSERT INTO `cart` VALUES (28, 1, 6, 1, '2025-07-24 20:17:11');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, '数码', 'uploads/category_icons/digital.svg');
INSERT INTO `categories` VALUES (2, '书籍', 'uploads/category_icons/book.svg');
INSERT INTO `categories` VALUES (3, '衣物', 'uploads/category_icons/clothes.png');
INSERT INTO `categories` VALUES (4, '生活用品', 'uploads/category_icons/life.svg');
INSERT INTO `categories` VALUES (5, '其他', 'uploads/category_icons/other.svg');

-- ----------------------------
-- Table structure for delivery
-- ----------------------------
DROP TABLE IF EXISTS `delivery`;
CREATE TABLE `delivery`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `transaction_id` int NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'pending',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `transaction_id`(`transaction_id` ASC) USING BTREE,
  CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of delivery
-- ----------------------------

-- ----------------------------
-- Table structure for item_images
-- ----------------------------
DROP TABLE IF EXISTS `item_images`;
CREATE TABLE `item_images`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sort` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `item_id`(`item_id` ASC) USING BTREE,
  CONSTRAINT `item_images_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item_images
-- ----------------------------
INSERT INTO `item_images` VALUES (1, 1, 'uploads/items/ipad.jpg', 0);
INSERT INTO `item_images` VALUES (2, 1, 'uploads/items/ipad2.jpg', 1);
INSERT INTO `item_images` VALUES (3, 1, 'uploads/items/ipad3.jpg', 2);
INSERT INTO `item_images` VALUES (4, 1, ' uploads/items/ipad4.jpg', 3);
INSERT INTO `item_images` VALUES (5, 2, 'uploads/items/books.jpg', 0);
INSERT INTO `item_images` VALUES (6, 2, 'uploads/items/books2.jpg', 1);
INSERT INTO `item_images` VALUES (7, 2, 'uploads/items/books3.jpg', 2);
INSERT INTO `item_images` VALUES (8, 3, 'uploads/items/coat.jpg', 0);
INSERT INTO `item_images` VALUES (9, 3, 'uploads/items/coat2.jpg', 1);
INSERT INTO `item_images` VALUES (10, 3, 'uploads/items/coat3.jpg', 2);
INSERT INTO `item_images` VALUES (11, 4, 'uploads/items/ricecooker.jpg', 0);
INSERT INTO `item_images` VALUES (12, 4, 'uploads/items/ricecooker2.jpg', 1);
INSERT INTO `item_images` VALUES (13, 4, 'uploads/items/ricecooker3.jpg', 2);
INSERT INTO `item_images` VALUES (14, 5, 'uploads/items/phone.jpg', 0);
INSERT INTO `item_images` VALUES (15, 5, 'uploads/items/phone2.jpg', 1);
INSERT INTO `item_images` VALUES (16, 5, 'uploads/items/phone3.jpg', 2);
INSERT INTO `item_images` VALUES (17, 6, 'uploads/items/englishbook.jpg', 0);
INSERT INTO `item_images` VALUES (18, 6, 'uploads/items/englishbook2.jpg', 1);
INSERT INTO `item_images` VALUES (19, 6, 'uploads/items/englishbook3.jpg', 2);
INSERT INTO `item_images` VALUES (20, 7, 'uploads/items/jeans.jpg', 0);
INSERT INTO `item_images` VALUES (21, 8, 'uploads/items/lamp.jpg', 0);
INSERT INTO `item_images` VALUES (22, 9, 'uploads/items/earphone.jpg', 0);
INSERT INTO `item_images` VALUES (23, 10, 'uploads/items/mathbook.jpg', 0);
INSERT INTO `item_images` VALUES (24, 11, 'uploads/items/shoes.jpg', 0);
INSERT INTO `item_images` VALUES (25, 12, 'uploads/items/kettle.jpg', 0);
INSERT INTO `item_images` VALUES (26, 13, 'uploads/items/laptop.jpg', 0);
INSERT INTO `item_images` VALUES (27, 14, 'uploads/items/dress.jpg', 0);
INSERT INTO `item_images` VALUES (28, 15, 'uploads/items/box.jpg', 0);
INSERT INTO `item_images` VALUES (41, 25, 'uploads/file-1753359800522-523510366.png', 1);
INSERT INTO `item_images` VALUES (42, 25, 'uploads/file-1753359800544-849793532.png', 2);
INSERT INTO `item_images` VALUES (43, 25, 'uploads/file-1753359800592-719292749.png', 3);
INSERT INTO `item_images` VALUES (44, 25, 'uploads/file-1753359804801-380875111.png', 4);
INSERT INTO `item_images` VALUES (45, 25, 'uploads/file-1753359804817-633690176.png', 5);

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `category_id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `price` decimal(10, 2) NOT NULL,
  `item_condition` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'onsale',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `category_id`(`category_id` ASC) USING BTREE,
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `items_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES (1, 1, 1, '二手iPad', '成色很新，带保护壳', 1200.00, '九成新', 'uploads/items/ipad.jpg', 'onsale', '2025-07-17 09:13:29');
INSERT INTO `items` VALUES (2, 2, 2, '考研书籍', '2024版，部分有笔记', 80.00, '八成新', 'uploads/items/books.jpg', 'onsale', '2025-07-17 09:13:29');
INSERT INTO `items` VALUES (3, 3, 3, '羽绒服', '冬天保暖，尺码L', 150.00, '七成新', 'uploads/items/coat.jpg', 'sold', '2025-07-17 09:13:29');
INSERT INTO `items` VALUES (4, 1, 4, '电饭煲', '宿舍常用，功能正常', 60.00, '八成新', 'uploads/items/ricecooker.jpg', 'onsale', '2025-07-17 09:13:29');
INSERT INTO `items` VALUES (5, 2, 1, '二手手机', '小米10，运行流畅', 900.00, '八成新', 'uploads/items/phone.jpg', 'onsale', '2025-07-17 09:13:29');
INSERT INTO `items` VALUES (6, 3, 2, '英语四级书', '有笔记，适合备考', 20.00, '七成新', 'uploads/items/englishbook.jpg', 'sold', '2025-07-17 09:13:29');
INSERT INTO `items` VALUES (7, 1, 3, '牛仔裤', '尺码M，适合女生', 40.00, '九成新', 'uploads/items/jeans.jpg', 'onsale', '2025-07-17 09:13:29');
INSERT INTO `items` VALUES (8, 2, 4, '台灯', '宿舍神器，三档亮度', 25.00, '九成新', 'uploads/items/lamp.jpg', 'onsale', '2025-07-17 09:13:29');
INSERT INTO `items` VALUES (9, 3, 1, '蓝牙耳机', '音质好，续航长', 120.00, '八成新', 'uploads/items/earphone.jpg', 'onsale', '2025-07-17 09:13:29');
INSERT INTO `items` VALUES (10, 1, 2, '高数教材', '无笔记，几乎全新', 35.00, '九五新', 'uploads/items/mathbook.jpg', 'onsale', '2025-07-17 09:13:29');
INSERT INTO `items` VALUES (11, 2, 3, '运动鞋', 'Nike，42码', 180.00, '八成新', 'uploads/items/shoes.jpg', 'onsale', '2025-07-17 09:13:29');
INSERT INTO `items` VALUES (12, 3, 4, '电水壶', '烧水快，容量大', 35.00, '八成新', 'uploads/items/kettle.jpg', 'onsale', '2025-07-17 09:13:29');
INSERT INTO `items` VALUES (13, 1, 1, '二手笔记本电脑', '联想ThinkPad，办公利器', 2200.00, '七成新', 'uploads/items/laptop.jpg', 'onsale', '2025-07-17 09:13:29');
INSERT INTO `items` VALUES (14, 3, 3, '连衣裙', '夏季新款，L码', 55.00, '九成新', 'uploads/items/dress.png', 'onsale', '2025-07-17 09:13:29');
INSERT INTO `items` VALUES (15, 1, 4, '收纳箱', '塑料材质，容量大', 18.00, '九成新', 'uploads/items/box.jpg', 'onsale', '2025-07-17 09:13:29');
INSERT INTO `items` VALUES (25, 1, 1, '二手iphone', '九九成稀罕物', 3000.00, '九成新', 'uploads/file-1753359800522-523510366.png', '在售', '2025-07-24 20:24:02');

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `from_user_id` int NOT NULL,
  `to_user_id` int NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sent_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_read` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `from_user_id`(`from_user_id` ASC) USING BTREE,
  INDEX `to_user_id`(`to_user_id` ASC) USING BTREE,
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of messages
-- ----------------------------
INSERT INTO `messages` VALUES (1, 1, 2, '你好，这个iPad还在吗？', '2025-07-17 09:13:29', 1);
INSERT INTO `messages` VALUES (2, 2, 1, '在的，可以看下实物图', '2025-07-17 09:13:29', 1);
INSERT INTO `messages` VALUES (3, 3, 1, '电饭煲能便宜点吗？', '2025-07-17 09:13:29', 1);
INSERT INTO `messages` VALUES (4, 5, 1, 'nihao', '2025-07-22 23:15:04', 1);
INSERT INTO `messages` VALUES (5, 5, 2, '你好呀', '2025-07-22 23:40:01', 1);
INSERT INTO `messages` VALUES (6, 1, 5, 'nihao', '2025-07-23 00:28:14', 1);
INSERT INTO `messages` VALUES (7, 1, 2, 'gkd', '2025-07-23 09:30:28', 1);
INSERT INTO `messages` VALUES (8, 2, 3, 'nih', '2025-07-23 10:40:29', 1);
INSERT INTO `messages` VALUES (9, 5, 3, 'nihao', '2025-07-23 11:11:05', 1);
INSERT INTO `messages` VALUES (20, 0, 1, '您已成功购买商品：考研书籍', '2025-07-24 14:12:30', 0);
INSERT INTO `messages` VALUES (21, 0, 2, '您的商品 考研书籍 已被购买', '2025-07-24 14:12:30', 0);
INSERT INTO `messages` VALUES (22, 1, 3, '可小刀', '2025-07-24 14:34:34', 1);
INSERT INTO `messages` VALUES (23, 0, 1, '您已成功购买商品：羽绒服', '2025-07-24 15:02:06', 0);
INSERT INTO `messages` VALUES (24, 0, 3, '您的商品 羽绒服 已被购买', '2025-07-24 15:02:06', 0);
INSERT INTO `messages` VALUES (29, 1, 3, '哈哈哈', '2025-07-24 20:13:24', 1);
INSERT INTO `messages` VALUES (30, 1, 3, 'hhh', '2025-07-24 20:17:17', 1);
INSERT INTO `messages` VALUES (31, 0, 1, '您已成功购买商品：英语四级书', '2025-07-24 20:21:42', 0);
INSERT INTO `messages` VALUES (32, 0, 3, '您的商品 英语四级书 已被购买', '2025-07-24 20:21:42', 0);
INSERT INTO `messages` VALUES (33, 1, 5, '哈哈哈', '2025-07-24 20:24:36', 0);

-- ----------------------------
-- Table structure for reviews
-- ----------------------------
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `transaction_id` int NOT NULL,
  `reviewer_id` int NOT NULL,
  `reviewee_id` int NOT NULL,
  `rating` int NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `transaction_id`(`transaction_id` ASC) USING BTREE,
  INDEX `reviewer_id`(`reviewer_id` ASC) USING BTREE,
  INDEX `reviewee_id`(`reviewee_id` ASC) USING BTREE,
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`reviewee_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reviews
-- ----------------------------
INSERT INTO `reviews` VALUES (11, 12, 1, 3, 5, '666，好吃', '2025-07-24 15:06:14');
INSERT INTO `reviews` VALUES (13, 14, 1, 3, 3, '全是字，根本用不了', '2025-07-24 20:22:48');

-- ----------------------------
-- Table structure for transactions
-- ----------------------------
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `buyer_id` int NOT NULL,
  `seller_id` int NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `completed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `item_id`(`item_id` ASC) USING BTREE,
  INDEX `buyer_id`(`buyer_id` ASC) USING BTREE,
  INDEX `seller_id`(`seller_id` ASC) USING BTREE,
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transactions
-- ----------------------------
INSERT INTO `transactions` VALUES (12, 3, 1, 3, 150.00, 'reviewed', '2025-07-24 15:02:06', NULL);
INSERT INTO `transactions` VALUES (14, 6, 1, 3, 20.00, 'reviewed', '2025-07-24 20:21:42', NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `credit_score` int NULL DEFAULT 100,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (0, '通知消息', 'e10adc3949ba59abbe56e057f20f883e', '通知消息', 'uploads/avatars/system.png', NULL, 100, '2025-07-24 09:20:41');
INSERT INTO `users` VALUES (1, 'alice', 'e10adc3949ba59abbe56e057f20f883e', 'Alice', 'uploads/avatars/a.png', '13810000001', 98, '2025-07-17 09:13:29');
INSERT INTO `users` VALUES (2, 'bob', 'e10adc3949ba59abbe56e057f20f883e', 'Bob', 'uploads/avatars/b.png', '13800000002', 99, '2025-07-17 09:13:29');
INSERT INTO `users` VALUES (3, 'charlie1111', 'e10adc3949ba59abbe56e057f20f883e', 'Charlie', 'uploads/avatars/c.png', '13800000003', 94, '2025-07-17 09:13:29');
INSERT INTO `users` VALUES (5, 'qqbgxi', 'e10adc3949ba59abbe56e057f20f883e', 'qqbgxi', 'uploads/default_avatar.png', '14852648597', 100, '2025-07-21 15:34:46');

SET FOREIGN_KEY_CHECKS = 1;
