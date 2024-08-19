-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19-Ago-2024 às 14:03
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
(1, 'Ribeirâo Pires', '09454-230', 12, 'Palmital', 'Jardim Verão', 'Casa', 'São Paulo'),
(2, 'Ribeirâo Peres', '53564-752', 164, 'Azeitonos', 'Quintal Outono', 'Casa', 'São Paulo'),
(3, 'Ribeirâo Pines', '98534-213', 45, 'Pepinoses', 'Garagem Inverno', 'Casa', 'São Paulo'),
(4, 'Ribeirâo Cires', '24541-761', 98, 'Calabresos', 'Calçada Primavera', 'Casa', 'São Paulo'),
(5, 'Ribeirâo Ceris', '43898-647', 340, 'Tomatos', 'Riacho de Fevereiro', 'Apartamento', 'São Paulo'),
(6, 'Ribeirâo Ripes', '73654-588', 720, 'Ceboloide', 'Marés de Abril', 'Casa', 'São Paulo'),
(7, 'Ribeirâo Renes', '28764-124', 86, 'Couveiros', 'Ondas de Março', 'Casa', 'Minas Gerais'),
(8, 'Ribeirâo Sires', '92235-432', 699, 'Pierão', 'Aquifero de Maio', 'Casa', 'São Paulo'),
(9, 'Ribeirâo Cines', '54323-987', 236, 'Salamenses', 'Lagoa de Junho', 'Casa', 'Paraná'),
(10, 'Ribeirâo Penis', '09434-580', 33, 'Dragonaits', 'Poça de Julho', 'Casa', 'São Paulo');

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
  `comodos` bit(1) NOT NULL,
  `idmidida` int(11) DEFAULT NULL,
  `idproprietario` int(11) DEFAULT NULL,
  `idendereco` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
  `cpf` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `inquilino`
--

INSERT INTO `inquilino` (`idinquilino`, `rg`, `fiador`, `telefone`, `nome`, `email`, `cpf`) VALUES
(1, '34.423.762-4', 'Aline Dantas', '(11)98432-0385', 'Enzo Kingler', 'enzinhorei2@gmail.com', '453.534.234-97'),
(2, '75.586.678-6', 'Bruno Sorrisos', '(11)95478-4820', 'Sem Matas', 'noflorest12345678@outlook.com', '798.432.651-04'),
(3, '83.674.134-9', 'Bruno Zollotareff', '(11)23456-9837', 'Anna Delphine', 'beladopovo@gmail.com', '653.098.321-65'),
(4, '58.347.723-1', 'João Morango', '(11)24383-8731', 'Big Paulos', 'ograndepau@gmail.com', '437.375.127-45'),
(5, '92.432.673-3', 'Enzo Caetano', '(11)63522-6544', 'Pedrão Pedreiro', 'pedr0carn3s@hotmail.com', '324.468.236-53'),
(6, '93.524.452-5', 'Casepirro Gabriel', '(11)27685-8552', 'Boliviano de Nascença', 'muril0bet4@gmail.com', '423.368.269-42'),
(7, '72.364.921-2', 'Monark Kevyn', '(11)24658-7328', 'Small Mari', 'fofadodani2@etec.sp.gov.br', '258.137.342-76'),
(8, '37.254.912-7', 'Alexandre de Moraes', '(11)90813-5272', 'Lucas Mortandela', 'cabritotev3z@gmail,com', '345.872.537-52'),
(9, '82.649.134-6', 'Letícia Brisas', '(11)94264-7242', 'Wesley Safadão', 'reidelas@gmail.com', '539.525.234-43'),
(10, '57.234.815-8', 'Iago Dormes', '(11)96420-6735', 'NakaNaka Mura Mura', 'matadordejegue@etec.sp.gov.br', '524.616.198-67');

-- --------------------------------------------------------

--
-- Estrutura da tabela `midias`
--

CREATE TABLE `midias` (
  `idmidida` int(11) NOT NULL,
  `midia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
  MODIFY `codaluguel` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `idfiador` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `imovel`
--
ALTER TABLE `imovel`
  MODIFY `idimovel` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `inquilino`
--
ALTER TABLE `inquilino`
  MODIFY `idinquilino` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `midias`
--
ALTER TABLE `midias`
  MODIFY `idmidida` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `proprietario`
--
ALTER TABLE `proprietario`
  MODIFY `idproprietario` int(11) NOT NULL AUTO_INCREMENT;

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
