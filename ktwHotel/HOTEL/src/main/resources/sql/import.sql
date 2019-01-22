INSERT INTO `g_role` (`id`, `date_created`, `name`) VALUES
(1, '2017-04-23 09:26:12', 'USER'),
(2, '2017-04-23 09:26:12', 'ADMIN');

INSERT INTO `g_settings` (`id`, `date_created`, `date_updated`, `path`, `title_en`, `title_ge`, `title_ru`, `descr`) VALUES
(1, '2017-11-20 08:34:29', '2017-11-20', 'address', 'Georgia, Tbilisi, Gldani, 4 მ/რ, კორპუსი 103, ბინა 19.', 'საქართველო, თბილისი, გლდანი, 4 მ/რ, კორპუსი 103, ბინა 19.', 'საქართველო, თბილისი, გლდანი, 4 მ/რ, კორპუსი 103, ბინა 19.', 'მისამართის აღმნიშვნელი პარამეტრი. (გთხოვთ არ შეცვალოთ კოდური სახელი)'),
(2, '2017-11-20 08:36:50', '2017-11-20', 'telephone', '+995 595 366336', '+995 595 366336', '+995 595 366336', 'ტელეფონის აღმნიშვნელი პარამეტრი. (გთხოვთ არ შეცვალოთ კოდური სახელი)'),
(3, '2017-11-20 08:37:41', '2017-11-20', 'mobile', '+995 595 366336', '+995 595 366336', '+995 595 366336', 'მობილურის აღმნიშვნელი პარამეტრი. (გთხოვთ არ შეცვალოთ კოდური სახელი)'),
(4, '2017-11-20 08:39:30', '2017-11-20', 'infomail', 'info@instyle.ge', 'info@instyle.ge', 'info@instyle.ge', 'ელფოსტის აღმნიშვნელი პარამეტრი. (გთხოვთ არ შეცვალოთ კოდური სახელი)'),
(5, '2017-11-21 08:31:45', '2017-11-21', 'priceperkg', '$8.00 1kg', '$8.00-ს 1კგ ზე', '$8.00 1 кг', 'კილოგრამის ფასის აღმნიშვნელი პარამეტრი. (გთხოვთ არ შეცვალოთ კოდური სახელი)'),
(6, '2017-11-21 08:35:40', '2017-11-21', 'socialinstagram', 'https://www.instagram.com/toni.kr8s/', 'https://www.instagram.com/toni.kr8s/', 'https://www.instagram.com/toni.kr8s/', 'ინსტაგრამის მისამართი აღმნიშვნელი პარამეტრი. (გთხოვთ არ შეცვალოთ კოდური სახელი)'),
(7, '2017-11-21 08:36:59', '2017-11-21', 'socialfacebook', 'https://www.facebook.com/tonikroos/', 'https://www.facebook.com/tonikroos/', 'https://www.facebook.com/tonikroos/', 'ფეისბუქის აღმნიშვნელი პარამეტრი. (გთხოვთ არ შეცვალოთ კოდური სახელი)');


INSERT INTO `g_user` (`id`, `date_created`, `date_updated`, `is_active`, `address_1`, `address_2`, `balance`, `company_name`, `first_name_en`, `first_name_ge`, `is_foreigner`, `identification`, `img_url`, `is_juridical`, `last_name_en`, `last_name_ge`, `password`, `phone`, `user_room_code`, `username`, `city_id`, `role_id`) VALUES
(1, '2017-11-15 09:16:36', NULL, b'1', 'ატენის 6/8', 'ატენის 6/8', '0.00', NULL, 'MIKHEIl', 'მიხეილ', b'0', '01008049090', NULL, b'0', 'JANIASHVILI', 'ჯანიაშვილი', '$2a$10$a8YpDLsB/8agccP7KOV5WuV7WKtUoI.YeoNSLtNeyekOfl8J7Z8AK', '(593)47-40-04', 'GDX0002', 'mjaniko@gmail.co', 1, 1);
