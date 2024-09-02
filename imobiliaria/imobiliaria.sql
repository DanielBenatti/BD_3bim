-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Set-2024 às 14:08
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `imobiliaria`
--
CREATE DATABASE IF NOT EXISTS `imobiliaria` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `imobiliaria`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluguel`
--

CREATE TABLE `aluguel` (
  `codaluguel` int(11) NOT NULL,
  `datafim` date NOT NULL,
  `datainicio` date NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `valor` float(4,2) NOT NULL,
  `vencimento` date NOT NULL,
  `idinquilino` int(11) DEFAULT NULL,
  `idcorretor` int(11) DEFAULT NULL,
  `idimovel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `aluguel`
--

INSERT INTO `aluguel` (`codaluguel`, `datafim`, `datainicio`, `descricao`, `valor`, `vencimento`, `idinquilino`, `idcorretor`, `idimovel`) VALUES
(11, '2024-09-30', '2024-08-01', 'Aluguel de apartamento 101', 99.99, '2024-09-01', 1, 1, 1),
(12, '2024-10-31', '2024-08-15', 'Aluguel de casa 02', 99.99, '2024-10-01', 2, 2, 2),
(13, '2024-09-30', '2024-08-01', 'Aluguel de apartamento 303', 99.99, '2024-09-01', 3, 3, 3),
(14, '2024-10-31', '2024-08-20', 'Aluguel de casa com quintal', 99.99, '2024-10-01', 4, 4, 4),
(15, '2024-11-30', '2024-09-01', 'Aluguel de cobertura', 99.99, '2024-11-01', 5, 5, 5),
(16, '2024-09-30', '2024-08-15', 'Aluguel de apartamento 202', 99.99, '2024-09-01', 6, 6, 6),
(17, '2024-10-31', '2024-09-01', 'Aluguel de casa de campo', 99.99, '2024-10-01', 7, 7, 7),
(18, '2024-11-30', '2024-09-15', 'Aluguel de apartamento 403', 99.99, '2024-11-01', 8, 8, 8),
(19, '2024-09-30', '2024-08-01', 'Aluguel de casa 12', 99.99, '2024-09-01', 9, 9, 9),
(20, '2024-10-31', '2024-09-01', 'Aluguel de apartamento duplex', 99.99, '2024-10-01', 10, 10, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `corretor`
--

CREATE TABLE `corretor` (
  `idcorretor` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `corretor`
--

INSERT INTO `corretor` (`idcorretor`, `email`, `telefone`, `nome`) VALUES
(1, 'joao.silva@email.com', '11987654321', 'João Silva'),
(2, 'ana.martins@email.com', '21987654321', 'Ana Martins'),
(3, 'paulo.santos@email.com', '31987654321', 'Paulo Santos'),
(4, 'luana.lima@email.com', '41987654321', 'Luana Lima'),
(5, 'marcos.pereira@email.com', '51987654321', 'Marcos Pereira'),
(6, 'carla.alves@email.com', '61987654321', 'Carla Alves'),
(7, 'roberto.ferrari@email.com', '71987654321', 'Roberto Ferrari'),
(8, 'juliana.souza@email.com', '81987654321', 'Juliana Souza'),
(9, 'fernando.costa@email.com', '91987654321', 'Fernando Costa'),
(10, 'patricia.gomes@email.com', '02987654321', 'Patricia Gomes');

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `idendereco` int(11) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `cep` varchar(255) NOT NULL,
  `numero` int(11) NOT NULL,
  `rua` varchar(255) NOT NULL,
  `bairro` varchar(255) NOT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`idendereco`, `cidade`, `cep`, `numero`, `rua`, `bairro`, `complemento`, `estado`) VALUES
(1, 'São Paulo', '01000-000', 123, 'Rua A', 'Bairro Centro', 'Apto 101', 'SP'),
(2, 'Rio de Janeiro', '20000-000', 456, 'Avenida B', 'Bairro Flamengo', '', 'RJ'),
(3, 'Belo Horizonte', '30100-000', 789, 'Rua C', 'Bairro Savassi', 'Bloco B', 'MG'),
(4, 'Porto Alegre', '90000-000', 101, 'Avenida D', 'Bairro Centro', 'Casa 12', 'RS'),
(5, 'Curitiba', '80000-000', 202, 'Rua E', 'Bairro Batel', '', 'PR'),
(6, 'Recife', '50000-000', 303, 'Avenida F', 'Bairro Boa Viagem', 'Sala 5', 'PE'),
(7, 'Fortaleza', '60000-000', 404, 'Rua G', 'Bairro Aldeota', 'Prédio 3', 'CE'),
(8, 'Salvador', '40000-000', 505, 'Avenida H', 'Bairro Barra', '', 'BA'),
(9, 'Brasília', '70000-000', 606, 'Rua I', 'Bairro Asa Norte', 'Conjunto 7', 'DF'),
(10, 'Manaus', '69000-000', 707, 'Avenida J', 'Bairro Centro', '', 'AM');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fiador`
--

CREATE TABLE `fiador` (
  `idfiador` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `rg` varchar(255) DEFAULT NULL,
  `cpf` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `idendereco` int(11) DEFAULT NULL,
  `idinquilino` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `fiador`
--

INSERT INTO `fiador` (`idfiador`, `email`, `telefone`, `rg`, `cpf`, `nome`, `idendereco`, `idinquilino`) VALUES
(1, 'jose.silva@exemplo.com', '11987654321', '123456789', '123.456.789-00', 'José Silva', 1, 1),
(2, 'maria.souza@exemplo.com', '11987654322', '234567890', '234.567.890-01', 'Maria Souza', 2, 2),
(3, 'joao.pereira@exemplo.com', '11987654323', '345678901', '345.678.901-02', 'João Pereira', 3, 3),
(4, 'ana.lima@exemplo.com', '11987654324', '456789012', '456.789.012-03', 'Ana Lima', 4, 4),
(5, 'carlos.oliveira@exemplo.com', '11987654325', '567890123', '567.890.123-04', 'Carlos Oliveira', 5, 5),
(6, 'lucas.martins@exemplo.com', '11987654326', '678901234', '678.901.234-05', 'Lucas Martins', 6, 6),
(7, 'patricia.almeida@exemplo.com', '11987654327', '789012345', '789.012.345-06', 'Patrícia Almeida', 7, 7),
(8, 'fernando.rodrigues@exemplo.com', '11987654328', '890123456', '890.123.456-07', 'Fernando Rodrigues', 8, 8),
(9, 'juliana.gomes@exemplo.com', '11987654329', '901234567', '901.234.567-08', 'Juliana Gomes', 9, 9),
(10, 'ricardo.santos@exemplo.com', '11987654330', '012345678', '012.345.678-09', 'Ricardo Santos', 10, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `imovel`
--

CREATE TABLE `imovel` (
  `idimovel` int(11) NOT NULL,
  `disponivel` bit(1) NOT NULL,
  `area` varchar(255) NOT NULL,
  `suite` bit(1) NOT NULL,
  `banheiros` int(11) NOT NULL,
  `complemento` varchar(255) NOT NULL,
  `garagem` bit(1) NOT NULL,
  `lavanderia` bit(1) NOT NULL,
  `piscina` bit(1) NOT NULL,
  `comodos` int(11) NOT NULL,
  `idmidida` int(11) DEFAULT NULL,
  `idproprietario` int(11) DEFAULT NULL,
  `idendereco` int(11) DEFAULT NULL,
  `condominio` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `imovel`
--

INSERT INTO `imovel` (`idimovel`, `disponivel`, `area`, `suite`, `banheiros`, `complemento`, `garagem`, `lavanderia`, `piscina`, `comodos`, `idmidida`, `idproprietario`, `idendereco`, `condominio`) VALUES
(1, b'1', '120 m²', b'1', 2, 'Apto 101', b'1', b'1', b'0', 1, 1, 1, 1, b'1'),
(2, b'0', '80 m²', b'0', 1, 'Casa 02', b'0', b'1', b'1', 0, 2, 2, 2, b'0'),
(3, b'1', '150 m²', b'1', 3, 'Bloco B - Apt 303', b'1', b'0', b'1', 1, 3, 3, 3, b'0'),
(4, b'1', '100 m²', b'0', 2, 'Casa com quintal', b'1', b'1', b'0', 1, 4, 4, 4, b'0'),
(5, b'0', '200 m²', b'1', 4, 'Apartamento Cobertura', b'1', b'1', b'1', 2, 5, 5, 5, b'0'),
(6, b'1', '90 m²', b'1', 1, 'Apto 202', b'0', b'1', b'0', 1, 6, 6, 6, b'0'),
(7, b'0', '110 m²', b'0', 2, 'Casa de Campo', b'1', b'0', b'0', 2, 7, 7, 7, b'0'),
(8, b'1', '140 m²', b'1', 3, 'Apto 403', b'1', b'1', b'1', 2, 8, 8, 8, b'0'),
(9, b'1', '70 m²', b'0', 1, 'Casa 12', b'0', b'1', b'0', 1, 9, 9, 9, b'0'),
(10, b'0', '180 m²', b'1', 3, 'Apartamento Duplex', b'1', b'0', b'1', 2, 10, 10, 10, b'0'),
(11, b'1', '120 m²', b'1', 2, 'Apartamento 101', b'1', b'1', b'0', 3, 1, 1, 1, b'0'),
(12, b'0', '80 m²', b'0', 1, 'Casa 5', b'1', b'1', b'1', 2, 2, 2, 2, b'0'),
(13, b'1', '150 m²', b'1', 3, 'Cobertura 202', b'1', b'0', b'1', 5, 3, 3, 3, b'0'),
(14, b'1', '90 m²', b'1', 1, 'Casa 8', b'0', b'1', b'0', 4, 4, 4, 4, b'0'),
(15, b'0', '200 m²', b'1', 4, 'Apartamento 303', b'1', b'1', b'1', 6, 5, 5, 5, b'0'),
(16, b'1', '110 m²', b'1', 2, 'Apartamento 404', b'1', b'1', b'0', 4, 6, 6, 6, b'0'),
(17, b'0', '95 m²', b'1', 1, 'Casa 10', b'1', b'0', b'0', 3, 7, 7, 7, b'0'),
(18, b'1', '130 m²', b'1', 2, 'Cobertura 505', b'1', b'1', b'1', 5, 8, 8, 8, b'0'),
(19, b'1', '70 m²', b'0', 1, 'Apartamento 606', b'0', b'1', b'0', 3, 9, 9, 9, b'0'),
(20, b'1', '160 m²', b'1', 3, 'Casa 12', b'1', b'1', b'1', 6, 10, 10, 10, b'0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `inquilino`
--

CREATE TABLE `inquilino` (
  `idinquilino` int(11) NOT NULL,
  `rg` varchar(255) DEFAULT NULL,
  `fiador` varchar(255) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cpf` varchar(255) NOT NULL,
  `datanasc` date DEFAULT NULL,
  `salario` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `inquilino`
--

INSERT INTO `inquilino` (`idinquilino`, `rg`, `fiador`, `telefone`, `nome`, `email`, `cpf`, `datanasc`, `salario`) VALUES
(1, '34.423.762-4', 'Aline Dantas', '(11)98432-0385', 'Enzo Kingler', 'enzinhorei2@gmail.com', '453.534.234-97', '1995-01-01', '1800.00'),
(2, '75.586.678-6', 'Bruno Sorrisos', '(11)95478-4820', 'Sem Matas', 'noflorest12345678@outlook.com', '798.432.651-04', '1996-02-02', '2200.00'),
(3, '83.674.134-9', 'Bruno Zollotareff', '(11)23456-9837', 'Anna Delphine', 'beladopovo@gmail.com', '653.098.321-65', '1997-03-03', '2750.00'),
(4, '58.347.723-1', 'João Morango', '(11)24383-8731', 'Big Paulos', 'ograndepau@gmail.com', '437.375.127-45', '1998-04-04', '3300.00'),
(5, '92.432.673-3', 'Enzo Caetano', '(11)63522-6544', 'Pedrão Pedreiro', 'pedr0carn3s@hotmail.com', '324.468.236-53', '1999-05-05', '3800.00'),
(6, '93.524.452-5', 'Casepirro Gabriel', '(11)27685-8552', 'Boliviano de Nascença', 'muril0bet4@gmail.com', '423.368.269-42', '2000-06-06', '2600.00'),
(7, '72.364.921-2', 'Monark Kevyn', '(11)24658-7328', 'Small Mari', 'fofadodani2@etec.sp.gov.br', '258.137.342-76', '2001-07-07', '3400.00'),
(8, '37.254.912-7', 'Alexandre de Moraes', '(11)90813-5272', 'Lucas Mortandela', 'cabritotev3z@gmail,com', '345.872.537-52', '2002-08-08', '2900.00'),
(9, '82.649.134-6', 'Letícia Brisas', '(11)94264-7242', 'Wesley Safadão', 'reidelas@gmail.com', '539.525.234-43', '2003-09-09', '4000.00'),
(10, '57.234.815-8', 'Iago Dormes', '(11)96420-6735', 'NakaNaka Mura Mura', 'matadordejegue@etec.sp.gov.br', '524.616.198-67', '2004-10-10', '3150.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `midias`
--

CREATE TABLE `midias` (
  `idmidida` int(11) NOT NULL,
  `midia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `midias`
--

INSERT INTO `midias` (`idmidida`, `midia`) VALUES
(1, 'foto_externa_1.jpg'),
(2, 'foto_interna_1.jpg'),
(3, 'foto_quarto_1.jpg'),
(4, 'foto_sala_1.jpg'),
(5, 'foto_cozinha_1.jpg'),
(6, 'foto_externa_2.jpg'),
(7, 'foto_interna_2.jpg'),
(8, 'foto_quarto_2.jpg'),
(9, 'foto_sala_2.jpg'),
(10, 'foto_cozinha_2.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `proprietario`
--

CREATE TABLE `proprietario` (
  `idproprietario` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `pix` varchar(255) DEFAULT NULL,
  `banco` varchar(255) DEFAULT NULL,
  `agencia` varchar(255) NOT NULL,
  `idendereco` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `proprietario`
--

INSERT INTO `proprietario` (`idproprietario`, `email`, `telefone`, `nome`, `pix`, `banco`, `agencia`, `idendereco`) VALUES
(1, 'jose.silva@example.com', '1134567890', 'José Silva', '12345678901', 'Banco do Brasil', '001', 1),
(2, 'maria.souza@example.com', '1145678901', 'Maria Souza', '23456789012', 'Bradesco', '002', 2),
(3, 'joao.pereira@example.com', '1156789012', 'João Pereira', '34567890123', 'Itaú', '003', 3),
(4, 'ana.lima@example.com', '1167890123', 'Ana Lima', '45678901234', 'Santander', '004', 4),
(5, 'carlos.oliveira@example.com', '1178901234', 'Carlos Oliveira', '56789012345', 'Caixa Econômica Federal', '005', 5),
(6, 'lucas.martins@example.com', '1189012345', 'Lucas Martins', '67890123456', 'HSBC', '006', 6),
(7, 'patricia.almeida@example.com', '1190123456', 'Patrícia Almeida', '78901234567', 'Banco do Brasil', '007', 7),
(8, 'fernando.rodrigues@example.com', '1101234567', 'Fernando Rodrigues', '89012345678', 'Bradesco', '008', 8),
(9, 'juliana.gomes@example.com', '1112345678', 'Juliana Gomes', '90123456789', 'Itaú', '009', 9),
(10, 'ricardo.santos@example.com', '1123456789', 'Ricardo Santos', '01234567890', 'Santander', '010', 10);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `aluguel`
--
ALTER TABLE `aluguel`
  ADD PRIMARY KEY (`codaluguel`),
  ADD KEY `idinquilino` (`idinquilino`),
  ADD KEY `idcorretor` (`idcorretor`),
  ADD KEY `idimovel` (`idimovel`);

--
-- Índices para tabela `corretor`
--
ALTER TABLE `corretor`
  ADD PRIMARY KEY (`idcorretor`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`idendereco`),
  ADD UNIQUE KEY `cep` (`cep`);

--
-- Índices para tabela `fiador`
--
ALTER TABLE `fiador`
  ADD PRIMARY KEY (`idfiador`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `rg` (`rg`),
  ADD KEY `idendereco` (`idendereco`),
  ADD KEY `idinquilino` (`idinquilino`);

--
-- Índices para tabela `imovel`
--
ALTER TABLE `imovel`
  ADD PRIMARY KEY (`idimovel`),
  ADD KEY `idproprietario` (`idproprietario`),
  ADD KEY `idendereco` (`idendereco`),
  ADD KEY `idmidida` (`idmidida`);

--
-- Índices para tabela `inquilino`
--
ALTER TABLE `inquilino`
  ADD PRIMARY KEY (`idinquilino`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `rg` (`rg`);

--
-- Índices para tabela `midias`
--
ALTER TABLE `midias`
  ADD PRIMARY KEY (`idmidida`);

--
-- Índices para tabela `proprietario`
--
ALTER TABLE `proprietario`
  ADD PRIMARY KEY (`idproprietario`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `pix` (`pix`),
  ADD KEY `idendereco` (`idendereco`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aluguel`
--
ALTER TABLE `aluguel`
  MODIFY `codaluguel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `corretor`
--
ALTER TABLE `corretor`
  MODIFY `idcorretor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `idendereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `fiador`
--
ALTER TABLE `fiador`
  MODIFY `idfiador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `imovel`
--
ALTER TABLE `imovel`
  MODIFY `idimovel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `inquilino`
--
ALTER TABLE `inquilino`
  MODIFY `idinquilino` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `midias`
--
ALTER TABLE `midias`
  MODIFY `idmidida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `proprietario`
--
ALTER TABLE `proprietario`
  MODIFY `idproprietario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aluguel`
--
ALTER TABLE `aluguel`
  ADD CONSTRAINT `aluguel_ibfk_1` FOREIGN KEY (`idinquilino`) REFERENCES `inquilino` (`idinquilino`),
  ADD CONSTRAINT `aluguel_ibfk_2` FOREIGN KEY (`idcorretor`) REFERENCES `corretor` (`idcorretor`),
  ADD CONSTRAINT `aluguel_ibfk_3` FOREIGN KEY (`idimovel`) REFERENCES `imovel` (`idimovel`);

--
-- Limitadores para a tabela `fiador`
--
ALTER TABLE `fiador`
  ADD CONSTRAINT `fiador_ibfk_1` FOREIGN KEY (`idendereco`) REFERENCES `endereco` (`idendereco`),
  ADD CONSTRAINT `fiador_ibfk_2` FOREIGN KEY (`idinquilino`) REFERENCES `inquilino` (`idinquilino`);

--
-- Limitadores para a tabela `imovel`
--
ALTER TABLE `imovel`
  ADD CONSTRAINT `imovel_ibfk_1` FOREIGN KEY (`idproprietario`) REFERENCES `proprietario` (`idproprietario`),
  ADD CONSTRAINT `imovel_ibfk_2` FOREIGN KEY (`idendereco`) REFERENCES `endereco` (`idendereco`),
  ADD CONSTRAINT `imovel_ibfk_3` FOREIGN KEY (`idmidida`) REFERENCES `midias` (`idmidida`);

--
-- Limitadores para a tabela `proprietario`
--
ALTER TABLE `proprietario`
  ADD CONSTRAINT `proprietario_ibfk_1` FOREIGN KEY (`idendereco`) REFERENCES `endereco` (`idendereco`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
