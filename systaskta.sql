-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07-Ago-2025 às 16:39
-- Versão do servidor: 10.4.20-MariaDB
-- versão do PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `academiatc`
--
CREATE DATABASE IF NOT EXISTS `academiatc` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `academiatc`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `alunos`
--

CREATE TABLE `alunos` (
  `ALUNO_ID` int(11) NOT NULL,
  `NOME` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `SENHA` varchar(255) DEFAULT NULL,
  `NUMERO_TELEFONE` varchar(20) DEFAULT NULL,
  `CRIADO_EM` datetime DEFAULT NULL,
  `ATUALIZADO_EM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `alunos`
--

INSERT INTO `alunos` (`ALUNO_ID`, `NOME`, `EMAIL`, `SENHA`, `NUMERO_TELEFONE`, `CRIADO_EM`, `ATUALIZADO_EM`) VALUES
(3, 'isaac', 'ikk539022@gmail.com', '$2y$10$gr5/hwF0t0gxjgGPO3hUAeXgR.1P8k/M6oBJgB0g3YoOP/OtERM6.', '(14) 99622-864', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `atribuicoes`
--

CREATE TABLE `atribuicoes` (
  `atribuicao_id` int(11) NOT NULL,
  `curso_id` int(11) DEFAULT NULL,
  `nome_atribuicao` varchar(100) DEFAULT NULL,
  `descricao_atribuicao` text DEFAULT NULL,
  `data_de_atribuicao_devido` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comparecimento`
--

CREATE TABLE `comparecimento` (
  `comparecimento_id` int(11) NOT NULL,
  `aluno_id` int(11) DEFAULT NULL,
  `curso_id` int(11) DEFAULT NULL,
  `data_comparecimento` date DEFAULT NULL,
  `status_comparecimento` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cursos`
--

CREATE TABLE `cursos` (
  `curso_id` int(11) NOT NULL,
  `curso_nome` varchar(100) DEFAULT NULL,
  `curso_descricao` text DEFAULT NULL,
  `curso_duracao` int(11) DEFAULT NULL,
  `curso_fee` decimal(10,2) DEFAULT NULL,
  `criado_em` datetime DEFAULT NULL,
  `atualizado_em` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cursos`
--

INSERT INTO `cursos` (`curso_id`, `curso_nome`, `curso_descricao`, `curso_duracao`, `curso_fee`, `criado_em`, `atualizado_em`) VALUES
(2, 'isaac', 'ssssss', 34, '7.00', '2024-08-16 11:11:14', '2024-08-16 11:11:14');

-- --------------------------------------------------------

--
-- Estrutura da tabela `instrutores`
--

CREATE TABLE `instrutores` (
  `instrutor_id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `numero_telefone` varchar(20) DEFAULT NULL,
  `criado_em` datetime DEFAULT NULL,
  `atualizado_em` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `instrutores_curso`
--

CREATE TABLE `instrutores_curso` (
  `instrutor_id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `submissoes`
--

CREATE TABLE `submissoes` (
  `submissao_id` int(11) NOT NULL,
  `aluno_id` int(11) DEFAULT NULL,
  `atribuicao_id` int(11) DEFAULT NULL,
  `data_submissao` date DEFAULT NULL,
  `arquivo_submissao` varchar(100) DEFAULT NULL,
  `nota` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`ALUNO_ID`);

--
-- Índices para tabela `atribuicoes`
--
ALTER TABLE `atribuicoes`
  ADD PRIMARY KEY (`atribuicao_id`),
  ADD KEY `curso_id` (`curso_id`);

--
-- Índices para tabela `comparecimento`
--
ALTER TABLE `comparecimento`
  ADD PRIMARY KEY (`comparecimento_id`),
  ADD KEY `aluno_id` (`aluno_id`),
  ADD KEY `curso_id` (`curso_id`);

--
-- Índices para tabela `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`curso_id`);

--
-- Índices para tabela `instrutores`
--
ALTER TABLE `instrutores`
  ADD PRIMARY KEY (`instrutor_id`);

--
-- Índices para tabela `instrutores_curso`
--
ALTER TABLE `instrutores_curso`
  ADD PRIMARY KEY (`instrutor_id`,`curso_id`),
  ADD KEY `curso_id` (`curso_id`);

--
-- Índices para tabela `submissoes`
--
ALTER TABLE `submissoes`
  ADD PRIMARY KEY (`submissao_id`),
  ADD KEY `aluno_id` (`aluno_id`),
  ADD KEY `atribuicao_id` (`atribuicao_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alunos`
--
ALTER TABLE `alunos`
  MODIFY `ALUNO_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `atribuicoes`
--
ALTER TABLE `atribuicoes`
  ADD CONSTRAINT `atribuicoes_ibfk_1` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`curso_id`);

--
-- Limitadores para a tabela `comparecimento`
--
ALTER TABLE `comparecimento`
  ADD CONSTRAINT `comparecimento_ibfk_1` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`ALUNO_ID`),
  ADD CONSTRAINT `comparecimento_ibfk_2` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`curso_id`);

--
-- Limitadores para a tabela `instrutores_curso`
--
ALTER TABLE `instrutores_curso`
  ADD CONSTRAINT `instrutores_curso_ibfk_1` FOREIGN KEY (`instrutor_id`) REFERENCES `instrutores` (`instrutor_id`),
  ADD CONSTRAINT `instrutores_curso_ibfk_2` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`curso_id`);

--
-- Limitadores para a tabela `submissoes`
--
ALTER TABLE `submissoes`
  ADD CONSTRAINT `submissoes_ibfk_1` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`ALUNO_ID`),
  ADD CONSTRAINT `submissoes_ibfk_2` FOREIGN KEY (`atribuicao_id`) REFERENCES `atribuicoes` (`atribuicao_id`);
--
-- Banco de dados: `nodemcu_rfid_iot_projects`
--
CREATE DATABASE IF NOT EXISTS `nodemcu_rfid_iot_projects` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `nodemcu_rfid_iot_projects`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `table_the_iot_projects`
--

CREATE TABLE `table_the_iot_projects` (
  `name` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `table_the_iot_projects`
--

INSERT INTO `table_the_iot_projects` (`name`, `id`, `gender`, `email`, `mobile`) VALUES
('Joao', '62150E9B', 'Masculino', 'jao@gmail.ciom', '1499839389');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_registration`
--

CREATE TABLE `user_registration` (
  `id` int(11) NOT NULL,
  `id_table_the_iot_projects` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `user_registration`
--

INSERT INTO `user_registration` (`id`, `id_table_the_iot_projects`, `date`, `status`) VALUES
(2, '0C834517', '2022-10-29 18:19:17', 'Entrada'),
(3, '0C834517', '2022-10-29 18:19:42', 'Entrada');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `table_the_iot_projects`
--
ALTER TABLE `table_the_iot_projects`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `user_registration`
--
ALTER TABLE `user_registration`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `user_registration`
--
ALTER TABLE `user_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Banco de dados: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Extraindo dados da tabela `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"systaskta\",\"table\":\"task\"},{\"db\":\"systaskta\",\"table\":\"user\"},{\"db\":\"academiatc\",\"table\":\"alunos\"},{\"db\":\"nodemcu_rfid_iot_projects\",\"table\":\"table_the_iot_projects\"}]');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Extraindo dados da tabela `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-08-07 13:40:30', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"pt\"}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Índices para tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Índices para tabela `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Índices para tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Índices para tabela `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Índices para tabela `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Índices para tabela `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Índices para tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Índices para tabela `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Índices para tabela `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Índices para tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Índices para tabela `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Índices para tabela `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Índices para tabela `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Índices para tabela `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Índices para tabela `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Índices para tabela `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Índices para tabela `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Banco de dados: `systaskta`
--
CREATE DATABASE IF NOT EXISTS `systaskta` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `systaskta`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `task`
--

CREATE TABLE `task` (
  `ID` int(11) NOT NULL,
  `DATE_TIME` datetime NOT NULL,
  `TITLE` varchar(150) NOT NULL,
  `DESCRIPTION` longtext NOT NULL,
  `USER_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `LEVEL` int(11) NOT NULL COMMENT '1- ADM | 2 - USER'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `task`
--
ALTER TABLE `task`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Banco de dados: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Banco de dados: `whaticket`
--
CREATE DATABASE IF NOT EXISTS `whaticket` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `whaticket`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contactcustomfields`
--

CREATE TABLE `contactcustomfields` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `contactId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `profilePicUrl` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `isGroup` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `messages`
--

CREATE TABLE `messages` (
  `id` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `ack` int(11) NOT NULL DEFAULT 0,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `mediaType` varchar(255) DEFAULT NULL,
  `mediaUrl` varchar(255) DEFAULT NULL,
  `ticketId` int(11) NOT NULL,
  `createdAt` datetime(6) NOT NULL,
  `updatedAt` datetime(6) NOT NULL,
  `fromMe` tinyint(1) NOT NULL DEFAULT 0,
  `isDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `contactId` int(11) DEFAULT NULL,
  `quotedMsgId` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `queues`
--

CREATE TABLE `queues` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `greetingMessage` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `quickanswers`
--

CREATE TABLE `quickanswers` (
  `id` int(11) NOT NULL,
  `shortcut` text NOT NULL,
  `message` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20200717133438-create-users.js'),
('20200717144403-create-contacts.js'),
('20200717145643-create-tickets.js'),
('20200717151645-create-messages.js'),
('20200717170223-create-whatsapps.js'),
('20200723200315-create-contacts-custom-fields.js'),
('20200723202116-add-email-field-to-contacts.js'),
('20200730153237-remove-user-association-from-messages.js'),
('20200730153545-add-fromMe-to-messages.js'),
('20200813114236-change-ticket-lastMessage-column-type.js'),
('20200901235509-add-profile-column-to-users.js'),
('20200903215941-create-settings.js'),
('20200904220257-add-name-to-whatsapp.js'),
('20200906122228-add-name-default-field-to-whatsapp.js'),
('20200906155658-add-whatsapp-field-to-tickets.js'),
('20200919124112-update-default-column-name-on-whatsappp.js'),
('20200927220708-add-isDeleted-column-to-messages.js'),
('20200929145451-add-user-tokenVersion-column.js'),
('20200930162323-add-isGroup-column-to-tickets.js'),
('20200930194808-add-isGroup-column-to-contacts.js'),
('20201004150008-add-contactId-column-to-messages.js'),
('20201004155719-add-vcardContactId-column-to-messages.js'),
('20201004955719-remove-vcardContactId-column-to-messages.js'),
('20201026215410-add-retries-to-whatsapps.js'),
('20201028124427-add-quoted-msg-to-messages.js'),
('20210108001431-add-unreadMessages-to-tickets.js'),
('20210108164404-create-queues.js'),
('20210108164504-add-queueId-to-tickets.js'),
('20210108174594-associate-whatsapp-queue.js'),
('20210108204708-associate-users-queue.js'),
('20210109192513-add-greetingMessage-to-whatsapp.js'),
('20210818102605-create-quickAnswers.js'),
('20211016014719-add-farewellMessage-to-whatsapp.js'),
('20220223095932-add-whatsapp-to-user.js');

-- --------------------------------------------------------

--
-- Estrutura da tabela `settings`
--

CREATE TABLE `settings` (
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `settings`
--

INSERT INTO `settings` (`key`, `value`, `createdAt`, `updatedAt`) VALUES
('userApiToken', '176387a2-1273-4ee6-9e7e-b5e2bfd365d9', '2025-08-06 11:42:14', '2025-08-06 11:42:14'),
('userCreation', 'enabled', '2025-08-06 11:42:14', '2025-08-06 11:42:14');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `lastMessage` text DEFAULT NULL,
  `contactId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `createdAt` datetime(6) NOT NULL,
  `updatedAt` datetime(6) NOT NULL,
  `whatsappId` int(11) DEFAULT NULL,
  `isGroup` tinyint(1) NOT NULL DEFAULT 0,
  `unreadMessages` int(11) DEFAULT NULL,
  `queueId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `userqueues`
--

CREATE TABLE `userqueues` (
  `userId` int(11) NOT NULL,
  `queueId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `passwordHash` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `profile` varchar(255) NOT NULL DEFAULT 'admin',
  `tokenVersion` int(11) NOT NULL DEFAULT 0,
  `whatsappId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `passwordHash`, `createdAt`, `updatedAt`, `profile`, `tokenVersion`, `whatsappId`) VALUES
(1, 'Administrador', 'admin@whaticket.com', '$2a$08$WaEmpmFDD/XkDqorkpQ42eUZozOqRCPkPcTkmHHMyuTGUOkI8dHsq', '2025-08-06 11:42:14', '2025-08-06 11:42:14', 'admin', 0, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `whatsappqueues`
--

CREATE TABLE `whatsappqueues` (
  `whatsappId` int(11) NOT NULL,
  `queueId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `whatsapps`
--

CREATE TABLE `whatsapps` (
  `id` int(11) NOT NULL,
  `session` text DEFAULT NULL,
  `qrcode` text DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `battery` varchar(255) DEFAULT NULL,
  `plugged` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `isDefault` tinyint(1) NOT NULL DEFAULT 0,
  `retries` int(11) NOT NULL DEFAULT 0,
  `greetingMessage` text DEFAULT NULL,
  `farewellMessage` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `contactcustomfields`
--
ALTER TABLE `contactcustomfields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contactId` (`contactId`);

--
-- Índices para tabela `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`);

--
-- Índices para tabela `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticketId` (`ticketId`),
  ADD KEY `Messages_contactId_foreign_idx` (`contactId`),
  ADD KEY `Messages_quotedMsgId_foreign_idx` (`quotedMsgId`);

--
-- Índices para tabela `queues`
--
ALTER TABLE `queues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `color` (`color`);

--
-- Índices para tabela `quickanswers`
--
ALTER TABLE `quickanswers`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices para tabela `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`key`);

--
-- Índices para tabela `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contactId` (`contactId`),
  ADD KEY `userId` (`userId`),
  ADD KEY `Tickets_whatsappId_foreign_idx` (`whatsappId`),
  ADD KEY `Tickets_queueId_foreign_idx` (`queueId`);

--
-- Índices para tabela `userqueues`
--
ALTER TABLE `userqueues`
  ADD PRIMARY KEY (`userId`,`queueId`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `Users_whatsappId_foreign_idx` (`whatsappId`);

--
-- Índices para tabela `whatsappqueues`
--
ALTER TABLE `whatsappqueues`
  ADD PRIMARY KEY (`whatsappId`,`queueId`);

--
-- Índices para tabela `whatsapps`
--
ALTER TABLE `whatsapps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `contactcustomfields`
--
ALTER TABLE `contactcustomfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `queues`
--
ALTER TABLE `queues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `quickanswers`
--
ALTER TABLE `quickanswers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `whatsapps`
--
ALTER TABLE `whatsapps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `contactcustomfields`
--
ALTER TABLE `contactcustomfields`
  ADD CONSTRAINT `contactcustomfields_ibfk_1` FOREIGN KEY (`contactId`) REFERENCES `contacts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `Messages_contactId_foreign_idx` FOREIGN KEY (`contactId`) REFERENCES `contacts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Messages_quotedMsgId_foreign_idx` FOREIGN KEY (`quotedMsgId`) REFERENCES `messages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`ticketId`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `Tickets_queueId_foreign_idx` FOREIGN KEY (`queueId`) REFERENCES `queues` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Tickets_whatsappId_foreign_idx` FOREIGN KEY (`whatsappId`) REFERENCES `whatsapps` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`contactId`) REFERENCES `contacts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limitadores para a tabela `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `Users_whatsappId_foreign_idx` FOREIGN KEY (`whatsappId`) REFERENCES `whatsapps` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
--
-- Banco de dados: `yor`
--
CREATE DATABASE IF NOT EXISTS `yor` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `yor`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aceita_termos`
--

CREATE TABLE `aceita_termos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `data_aceite` datetime DEFAULT NULL,
  `versao_termos` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `aceita_termos`
--

INSERT INTO `aceita_termos` (`id`, `usuario_id`, `data_aceite`, `versao_termos`) VALUES
(1, 25, '2024-08-06 05:49:22', '1'),
(2, 26, '2024-08-18 00:43:19', '1'),
(3, 28, '2024-09-13 09:14:26', '1'),
(4, 29, '2024-09-13 16:11:20', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `favoritos`
--

CREATE TABLE `favoritos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `obra_id` int(11) DEFAULT NULL,
  `data_favorito` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `favoritos`
--

INSERT INTO `favoritos` (`id`, `usuario_id`, `obra_id`, `data_favorito`) VALUES
(1, 21, 2, '2024-08-17 18:44:50'),
(2, 21, 6, '2024-08-17 18:45:07'),
(3, 21, 5, '2024-08-17 18:52:52'),
(4, 21, 4, '2024-08-17 19:46:56'),
(5, 26, 6, '2024-08-17 20:03:43'),
(6, 26, 3, '2024-08-17 20:03:57'),
(7, 26, 2, '2024-08-17 20:04:12'),
(8, 26, 5, '2024-08-17 20:44:03'),
(9, 26, 7, '2024-08-17 21:37:45'),
(10, 26, 8, '2024-08-17 21:40:42'),
(11, 26, 4, '2024-08-17 22:12:58'),
(12, 20, 7, '2024-08-17 23:28:10'),
(13, 20, 3, '2024-08-19 02:24:23'),
(14, 20, 15, '2024-08-28 06:31:02'),
(15, 20, 30, '2024-09-13 03:33:48'),
(16, 28, 26, '2024-09-13 04:15:08'),
(17, 20, 6, '2024-09-13 11:14:48'),
(18, 20, 31, '2024-09-13 11:15:51');

-- --------------------------------------------------------

--
-- Estrutura da tabela `obras`
--

CREATE TABLE `obras` (
  `ID` int(11) NOT NULL,
  `GENERO` varchar(100) NOT NULL,
  `CAPA` varchar(255) DEFAULT NULL,
  `TITULO` varchar(255) NOT NULL,
  `SINOPSE` text DEFAULT NULL,
  `AUTOR` int(11) NOT NULL,
  `DATA_CRIACAO` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `obras`
--

INSERT INTO `obras` (`ID`, `GENERO`, `CAPA`, `TITULO`, `SINOPSE`, `AUTOR`, `DATA_CRIACAO`) VALUES
(2, 'fantasia', 'uploads/icons8-espada-94.png', 'Sapo Curu', 'zxcvybunijmok,', 25, '2024-08-07 23:30:32'),
(3, 'romance', 'uploads/coraline.webp', 'Coraline e amor', 'Criança curiosa por tudo, inclusive pelo amor...', 25, '2024-08-08 04:02:19'),
(4, 'romance', 'uploads/Do nada os Bebês Dançando! (OSHI NO KO).jpg', 'Ai', 'asezxrdctfvygbuhnijmko,l.çlmkjhbgvfc', 21, '2024-08-08 22:03:43'),
(5, 'fantasia', 'uploads/Capturar11.PNG', 'Sapo Cururu 2', 'Na beira do rio...', 21, '2024-08-08 22:05:15'),
(6, 'ficcao', 'uploads/download.jpeg', 'Menina Visionária', 'Vou ajudar instituições e pobres...', 20, '2024-08-16 23:49:22'),
(7, 'ficcao', 'uploads/image-removebg-preview (18).png', 'OK!', 'LoremLoremLoremLoremLoremLoremLoremLorem', 26, '2024-08-17 21:37:25'),
(8, 'romance', 'uploads/image-removebg-preview (13).png', 'Anya and friends!', 'Anya Happy', 26, '2024-08-17 21:39:04'),
(9, 'fantasia', 'uploads/image-removebg-preview (19).png', 'Frieren', 'LoremLoremLoremLoremLoremLoremLorem', 26, '2024-08-17 21:40:05'),
(10, '[\"Ação\",\"Comédia\",\"Drama\"]', 'uploads/favorite_30dp_E60572_FILL0_wght400_GRAD0_opsz24.png', 'Coração rosa', 'vgbhnjmk,l.ç~;', 20, '2024-08-19 22:09:59'),
(13, '[\"Romance\"]', 'uploads/imagem_2024-08-19_222703287.png', 'Love in the Stars', 'LoremLoremLoremLoremLorem', 20, '2024-08-19 22:27:57'),
(15, '', 'uploads/imagem_2024-08-19_230747704.png', 'Crossfire', 'LoremLoremLoremLoremLoremLoremLorem', 20, '2024-08-19 23:08:29'),
(16, '[\"Ficção Científica\"]', 'uploads/imagem_2024-08-19_234004956.png', 'Além das Estrelas', 'Em um futuro não muito distante, a Terra era um planeta em constante crescimento, mas ao mesmo tempo, sufocante. A vida urbana fervilhava, e entre o caos de arranha-céus e carros voadores, havia uma cidade chamada Neoport. Neoport era o lar de astronautas, cientistas e, claro, de um grupo peculiar de amigos chamado \"Os Astrôneos\".', 20, '2024-08-19 23:41:04'),
(17, '[\"Fantasia\",\"Ficção Científica\"]', 'uploads/1724838591_favorito.png', 'Estrela brilha', 'SWEDRFTGYHUIMK,OL', 20, '2024-08-28 06:49:51'),
(25, '[\"Aventura\"]', 'uploads/1726206836_o-alienista-e28093-resumo-e-anc3a1lise-do-conto-de-machado-de-assis.webp', 'SLA', 'DRFTYUHIJKOL', 20, '2024-09-13 02:53:56'),
(26, '[\"Romance\",\"Comédia\"]', 'uploads/1726207716_download.gif', 'Fofo', 'Fofura...', 20, '2024-09-13 03:08:36'),
(27, 'romance', 'uploads/rei.png', 'Rei', 'LoremLoremLoremLoremLoremLorem', 20, '2024-09-13 08:15:10'),
(28, 'romance', 'uploads/sucesso.png', 'Sapo Curu', 'xdcftvgybhunjimk,', 20, '2024-09-13 08:18:09'),
(29, 'fantasia', 'uploads/rei.png', 'Rei', 'xdcftvygbuhnijmk', 20, '2024-09-13 08:19:20'),
(30, '[\"Ação\"]', 'uploads/1726209219_rei.png', 'Rei 2', 'ikujyhtgrfedws', 20, '2024-09-13 03:33:39'),
(31, '[\"Ação\",\"Aventura\"]', 'uploads/1726236938_teste.png', 'Teste', 'LoremLoremLoremLoremLoremLoremLoremLoremLorem', 20, '2024-09-13 11:15:38');

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE `perfil` (
  `usuario_id` int(11) NOT NULL,
  `nome_usuario` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `chave_pix` varchar(255) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `foto_perfil_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`usuario_id`, `nome_usuario`, `email`, `chave_pix`, `descricao`, `foto_perfil_url`) VALUES
(20, 'larissa180', 'lary@gmail.com', '1234567890', 'Meu perfil!', 'uploads/abra-o-livro.png'),
(21, 'rosana1209', 'Cleyton41bo@hotmail.com', '12345609', '', 'uploads/40d2b5271041886896ff8b08efed6112.jpg'),
(22, 'rosana12', 'Cleyton41@hotmail.com', '1234567890', 'swedrftyhum', 'uploads/icons8-boxe-94.png'),
(25, 'cleytinho', 'Cleytonbo@hotmail.com', '123456', 'frtgyuhijm,', 'uploads/icons8-boxe-94.png'),
(26, 'larissa_oliver18', 'lary18@gmail.com', '1234567890', 'wzsexdrcftvgybhunjimko,lp.ç´;', 'uploads/image-removebg-preview (15).png'),
(28, 'larih', 'lary1211@gmail.com', '1232323', 'Nova por aqui...', 'uploads/Hello Kitty Talk  _  Google Home.gif');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` int(11) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `NOME` varchar(255) NOT NULL,
  `SENHA` text NOT NULL,
  `DATA_CRIACAO` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`ID`, `EMAIL`, `NOME`, `SENHA`, `DATA_CRIACAO`) VALUES
(17, 'laryoliveira1811@gmail.com', 'larissa', '$2y$10$oepB.atqsKGFL1sjjBWzf.DZBK2NnvP.Modoe0mF.wgyZbvW6el6a', '2024-07-24 21:56:02'),
(19, 'laryoliveira@gmail.com', 'larissa18', '$2y$10$MLvGzGxMjR.Qc5PASSB4BOA3rJB.lCzE.I1JnewGS6KTpinFUp2km', '2024-07-24 22:12:58'),
(20, 'lary@gmail.com', 'larissa180', '$2y$10$orJ4fXg64x5tYBBfsk6mueWMiFSC.OVA5S9LYDsK0pYc3aEZNhpj.', '2024-07-24 22:30:10'),
(21, 'Cleyton41bo@hotmail.com', 'rosana1209', '$2y$10$8dy8UDQJhWwXMKtQ33xab.xu6qvckb5z.Gfm.jG/lXHgujk13W3PO', '2024-07-25 03:40:58'),
(22, 'Cleyton41@hotmail.com', 'rosana12', '$2y$10$ZbbFBzx6xjJ/XYWqs2z4L.uE.Td4JB5I/Ho.OOQlNGKumu/HMfuAy', '2024-07-25 03:41:52'),
(23, 'lary1234@gmail.com', 'lary19', '$2y$10$0ZdszO6QVv.TFi1KHhGRy.sRhiOlJPqxKEPmIjyFf/9.jXFcFt9Qy', '2024-08-06 08:35:56'),
(24, 'lary12@gmail.com', 'lary1911', '$2y$10$fArhD6X99rqdLvMJ5pA53eDpkxnLqbt1s9KTWOhjdu3KXNJA1qUd2', '2024-08-06 08:43:05'),
(25, 'Cleytonbo@hotmail.com', 'cleytinho', '$2y$10$m9wf6lHml8QZCM2aQTq/duVoAqWoWBeZKu5jDZ9N6.MQrKEtby3.m', '2024-08-06 08:49:22'),
(26, 'lary18@gmail.com', 'larissa_oliver18', '$2y$10$dN9xivMXeemyn3mHsbqAN.DflwxDqHHAj/7ID1HHaV6dlVquuRHIC', '2024-08-18 03:43:19'),
(28, 'lary1211@gmail.com', 'larih', '$2y$10$qybmWE/tzmkxo9Hudkrb/.S9fuA2q1wSc5Al3oY5NtqrC5pivIjp6', '2024-09-13 12:14:26'),
(29, 'user@gmail', 'user', '$2y$10$ZUeirRNb.c51dBRsKbkzj.My3Axlkdfs975ZlLQp2UdejHuOCAfIS', '2024-09-13 19:11:20');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `aceita_termos`
--
ALTER TABLE `aceita_termos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices para tabela `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`,`obra_id`),
  ADD KEY `obra_id` (`obra_id`);

--
-- Índices para tabela `obras`
--
ALTER TABLE `obras`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `AUTOR` (`AUTOR`);

--
-- Índices para tabela `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`usuario_id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`),
  ADD UNIQUE KEY `NOME` (`NOME`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aceita_termos`
--
ALTER TABLE `aceita_termos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `obras`
--
ALTER TABLE `obras`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aceita_termos`
--
ALTER TABLE `aceita_termos`
  ADD CONSTRAINT `aceita_termos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`ID`);

--
-- Limitadores para a tabela `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`ID`),
  ADD CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`obra_id`) REFERENCES `obras` (`ID`);

--
-- Limitadores para a tabela `obras`
--
ALTER TABLE `obras`
  ADD CONSTRAINT `obras_ibfk_1` FOREIGN KEY (`AUTOR`) REFERENCES `usuarios` (`ID`);

--
-- Limitadores para a tabela `perfil`
--
ALTER TABLE `perfil`
  ADD CONSTRAINT `perfil_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
