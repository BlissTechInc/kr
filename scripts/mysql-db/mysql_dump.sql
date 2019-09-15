CREATE TABLE `users` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL UNIQUE,
	`password` varchar(255) NOT NULL,
	`is_active` BOOLEAN NOT NULL,
	`is_creator` BOOLEAN NOT NULL,
	`last_login` TIMESTAMP NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `profiles` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL,
	`first_name` varchar(255) NOT NULL,
	`last_name` varchar(255) NOT NULL,
	`phone` varchar(255) NOT NULL,
	`bio` TEXT(255) NOT NULL,
	`image_url` varchar(255) NOT NULL,
	`thumb_url` varchar(255) NOT NULL,
	`vanity` varchar(255) NOT NULL,
	`twitter_url` VARCHAR(100),
	`instagram_url` VARCHAR(100),
	`snap_chat_url` VARCHAR(100),
	`website_url` VARCHAR(100),
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `messages` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`creator_id` INT NOT NULL,
	`subscriber_id` INT NOT NULL,
	`subject` varchar(255) NOT NULL,
	`content` TEXT NOT NULL,
	`is_read` BOOLEAN NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `posts` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL,
	`type` INT NOT NULL,
	`all_subscribers` BOOLEAN NOT NULL,
	`content` TEXT NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL,
	`deleted_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `photos` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT(255) NOT NULL,
	`album_id` INT(255) NOT NULL,
	`post_id` INT(255) NOT NULL,
	`type` INT(6) NOT NULL,
	`file` varchar(255) NOT NULL,
	`created_at` TIMESTAMP NOT NULL AUTO_INCREMENT,
	`updated_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `videos` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL,
	`post_id` INT NOT NULL,
	`file` varchar(255) NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL,
	`deleted_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `categories` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `user_category` (
	`user_id` INT NOT NULL,
	`category_id` INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`user_id`,`category_id`)
);

CREATE TABLE `photo_albums` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL,
	`post_id` INT NOT NULL,
	`name` varchar(255) NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `comments` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL,
	`post_id` INT NOT NULL,
	`album_id` INT NOT NULL,
	`photo_id` INT NOT NULL,
	`video_id` INT NOT NULL,
	`parent_id` INT NOT NULL,
	`content` TEXT NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL,
	`deleted_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `user_likes` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL,
	`post_id` INT NOT NULL,
	`album_id` INT NOT NULL,
	`video_id` INT NOT NULL,
	`comment_id` INT NOT NULL,
	`type` INT NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `profiles` ADD CONSTRAINT `profiles_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `messages` ADD CONSTRAINT `messages_fk0` FOREIGN KEY (`creator_id`) REFERENCES `users`(`id`);

ALTER TABLE `messages` ADD CONSTRAINT `messages_fk1` FOREIGN KEY (`subscriber_id`) REFERENCES `users`(`id`);

ALTER TABLE `posts` ADD CONSTRAINT `posts_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `photos` ADD CONSTRAINT `photos_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `photos` ADD CONSTRAINT `photos_fk1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums`(`id`);

ALTER TABLE `photos` ADD CONSTRAINT `photos_fk2` FOREIGN KEY (`post_id`) REFERENCES `posts`(`id`);

ALTER TABLE `videos` ADD CONSTRAINT `videos_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `videos` ADD CONSTRAINT `videos_fk1` FOREIGN KEY (`post_id`) REFERENCES `posts`(`id`);

ALTER TABLE `user_category` ADD CONSTRAINT `user_category_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `user_category` ADD CONSTRAINT `user_category_fk1` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`);

ALTER TABLE `photo_albums` ADD CONSTRAINT `photo_albums_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `photo_albums` ADD CONSTRAINT `photo_albums_fk1` FOREIGN KEY (`post_id`) REFERENCES `posts`(`id`);

ALTER TABLE `comments` ADD CONSTRAINT `comments_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `comments` ADD CONSTRAINT `comments_fk1` FOREIGN KEY (`post_id`) REFERENCES `posts`(`id`);

ALTER TABLE `comments` ADD CONSTRAINT `comments_fk2` FOREIGN KEY (`album_id`) REFERENCES `photo_albums`(`id`);

ALTER TABLE `comments` ADD CONSTRAINT `comments_fk3` FOREIGN KEY (`photo_id`) REFERENCES `photos`(`id`);

ALTER TABLE `comments` ADD CONSTRAINT `comments_fk4` FOREIGN KEY (`video_id`) REFERENCES `videos`(`id`);

ALTER TABLE `comments` ADD CONSTRAINT `comments_fk5` FOREIGN KEY (`parent_id`) REFERENCES `comments`(`id`);

ALTER TABLE `user_likes` ADD CONSTRAINT `user_likes_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `user_likes` ADD CONSTRAINT `user_likes_fk1` FOREIGN KEY (`post_id`) REFERENCES `posts`(`id`);

ALTER TABLE `user_likes` ADD CONSTRAINT `user_likes_fk2` FOREIGN KEY (`album_id`) REFERENCES `photo_albums`(`id`);

ALTER TABLE `user_likes` ADD CONSTRAINT `user_likes_fk3` FOREIGN KEY (`video_id`) REFERENCES `videos`(`id`);

ALTER TABLE `user_likes` ADD CONSTRAINT `user_likes_fk4` FOREIGN KEY (`comment_id`) REFERENCES `comments`(`id`);

