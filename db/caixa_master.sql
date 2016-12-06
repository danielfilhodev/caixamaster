-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 06-Dez-2016 às 01:07
-- Versão do servidor: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `caixa_master`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens_pedidos`
--

CREATE TABLE `itens_pedidos` (
  `id_itens_pedido` int(11) NOT NULL,
  `fk_id_produto` int(11) NOT NULL,
  `fk_id_pedido` int(11) NOT NULL,
  `qtd_produto` int(11) NOT NULL,
  `preco_venda` decimal(10,2) NOT NULL,
  `obs` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `itens_pedidos`
--

INSERT INTO `itens_pedidos` (`id_itens_pedido`, `fk_id_produto`, `fk_id_pedido`, `qtd_produto`, `preco_venda`, `obs`) VALUES
(1, 3, 1, 1, '5.00', ''),
(2, 2, 1, 1, '12.00', ''),
(3, 1, 1, 1, '15.00', ''),
(4, 2, 2, 5, '12.00', ''),
(5, 3, 2, 8, '5.00', ''),
(6, 1, 3, 2, '15.00', ''),
(7, 3, 3, 5, '5.00', ''),
(8, 2, 3, 8, '12.00', ''),
(9, 2, 4, 5, '12.00', ''),
(10, 2, 5, 65, '12.00', ''),
(11, 3, 6, 3, '5.00', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `dt_cad` date NOT NULL,
  `fk_id_user` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `valor_total`, `dt_cad`, `fk_id_user`) VALUES
(1, '32.00', '2016-11-28', 8),
(2, '100.00', '2016-11-28', 8),
(3, '151.00', '2016-11-29', 8),
(4, '60.00', '2016-11-29', 8),
(5, '780.00', '2016-11-29', 8),
(6, '15.00', '2016-11-29', 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id_produto` int(11) NOT NULL,
  `cod_produto` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `preco_venda` decimal(10,2) NOT NULL,
  `preco_compra` decimal(10,2) NOT NULL,
  `desc_produto` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id_produto`, `cod_produto`, `preco_venda`, `preco_compra`, `desc_produto`) VALUES
(1, 'CA38TU', '15.00', '1.00', 'CALCA JEANS'),
(2, 'CA39TE', '12.00', '0.50', 'CALÇA JEANS '),
(3, 'CA42U', '5.00', '1.00', 'CALÇA SOCIAL');

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos`
--

CREATE TABLE `servicos` (
  `id` int(11) NOT NULL,
  `dt_pg` date NOT NULL,
  `nota` int(4) NOT NULL,
  `cliente` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `descricao` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `dt_cad` date NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `servicos`
--

INSERT INTO `servicos` (`id`, `dt_pg`, `nota`, `cliente`, `valor`, `descricao`, `dt_cad`, `usuario_id`) VALUES
(3678, '0000-00-00', 258, 'teste', '266.58', 'teste', '2016-11-22', 6),
(3679, '0000-00-00', 3535, 'teste', '33.42', '', '2016-11-22', 6),
(3680, '2016-12-01', 1, 'teste', '253.16', '', '2016-11-22', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `user_id` int(11) NOT NULL COMMENT 'ID do Usuário',
  `user` varchar(255) NOT NULL COMMENT 'Usuário',
  `user_email` varchar(100) NOT NULL,
  `user_name` varchar(255) NOT NULL COMMENT 'Nome do usuário',
  `user_password` varchar(60) NOT NULL COMMENT 'Senha',
  `user_permissao` int(1) NOT NULL,
  `user_dt_cad` date NOT NULL,
  `status` int(1) DEFAULT NULL,
  `log` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`user_id`, `user`, `user_email`, `user_name`, `user_password`, `user_permissao`, `user_dt_cad`, `status`, `log`) VALUES
(1, 'admin', 'adm@adm.com', 'Daniel', '$2a$08$MzY4NDAzMDU3NTg0NWVmZOu0MUlo5mRHzu7RLgT5Zej/yGz/KJcpK', 1, '2016-12-05', 1, 'Responsável pelo cadastro<br> Nome: <br> Usuário: <br> Email: <br> Data: 05/12/2016 - 20:53:30<br> IP :::1'),
(2, 'robertO', 'roberto@rob.com', 'roberto barros', '$2a$08$OTAwNDc2MTYxNTg0NWY4Yu8oUKUThW6xAj9.Uq4B3j.sn78SFSND6', 2, '2016-12-05', 0, '1'),
(3, 'MaRcIo', 'marcio@teste.com', 'MARCIO RIBAS', '$2a$08$MzY2MTk4MzcyNTg0NWY5NeRXeY.9IXCk6Y2V9XRkDYu2x10qKGL5G', 3, '2016-12-05', 0, '1'),
(4, 'marcio23', 'marcio23@teste.com', 'dfaldsj', '$2a$08$MTAyNDU2ODA1NjU4NDVmYOFlEvz9Wwm1xwOauUS0Ruu53x7WytbeC', 3, '2016-12-05', 0, '1'),
(5, 'qq', 'qq@qq.com', 'qq', '$2a$08$NTc1MzYxODg5NTg0NWZkOOtcufVPORCRr54jo09QATrdcMozI6cb2', 3, '2016-12-05', 0, '1'),
(6, 'qq1', 'qq@qq.com1', 'qq1', '$2a$08$MTczMjczMDk4OTU4NDVmZ.EoXV5EMv9MYxfEsymuAh311/FdON09a', 3, '2016-12-05', 0, '1'),
(7, 'qq12', 'qq@qq.com12', 'qq12', '$2a$08$MTg5Nzk4MjQyOTU4NDVmZ.W4FpMWeS7so/yGmbV1hFg0mmd/b690G', 3, '2016-12-05', 0, '1'),
(8, 'qq123', 'qq@qq.com123', 'qq123', '$2a$08$MTQ4NDAzNjc1ODU4NDVmZOgy1uBsMKfwOeQAQV6SRjXmcLycD9UoG', 3, '2016-12-05', 0, '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `itens_pedidos`
--
ALTER TABLE `itens_pedidos`
  ADD PRIMARY KEY (`id_itens_pedido`);

--
-- Indexes for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_produto`);

--
-- Indexes for table `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `itens_pedidos`
--
ALTER TABLE `itens_pedidos`
  MODIFY `id_itens_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3681;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID do Usuário', AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
