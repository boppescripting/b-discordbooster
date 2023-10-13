CREATE TABLE `b_discordbooster` (
  `id` int(11) NOT NULL,
  `discord` text NOT NULL,
  `last_month_collected` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `b_discordbooster`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `discord` (`discord`) USING HASH;

ALTER TABLE `b_discordbooster`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;