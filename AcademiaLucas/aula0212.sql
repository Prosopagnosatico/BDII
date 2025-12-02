-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02/12/2025 às 16:17
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `aula0212`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `alocacoes`
--

CREATE TABLE `alocacoes` (
  `Codigo_Professor_Aloca` int(4) NOT NULL,
  `Codigo_Turma_Aloca` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `alunos`
--

CREATE TABLE `alunos` (
  `Matricula` int(11) NOT NULL,
  `Nome` varchar(40) NOT NULL,
  `Data_Nascimento` date NOT NULL,
  `Idade` int(4) NOT NULL,
  `CPF` varchar(14) NOT NULL,
  `RG_Identidade` varchar(20) NOT NULL,
  `Nome_Pai` varchar(40) NOT NULL,
  `Nome_Mae` varchar(40) NOT NULL,
  `Endereco` varchar(50) NOT NULL,
  `Numero` int(4) NOT NULL,
  `Cidade` varchar(35) NOT NULL,
  `Bairro` varchar(30) NOT NULL,
  `Estado` char(2) NOT NULL,
  `Telefone` varchar(25) NOT NULL,
  `Celular` varchar(25) DEFAULT NULL,
  `Grupo_Sangue` varchar(10) DEFAULT NULL,
  `Doador` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `matriculas`
--

CREATE TABLE `matriculas` (
  `Mat_Aluno` int(11) NOT NULL,
  `Cod_Turma` int(4) NOT NULL,
  `Valor` float(9,2) NOT NULL,
  `Data_Mat` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `professores`
--

CREATE TABLE `professores` (
  `Codigo` int(4) NOT NULL,
  `Nome` varchar(40) NOT NULL,
  `Data_Nascimento` date NOT NULL,
  `Idade` int(4) NOT NULL,
  `CPF` varchar(14) NOT NULL,
  `RG_Identidade` varchar(20) NOT NULL,
  `CPTS` varchar(20) NOT NULL,
  `Graduacao` varchar(20) NOT NULL,
  `Estado_Civil` varchar(25) NOT NULL,
  `Filhos` int(4) NOT NULL,
  `Endereco` varchar(50) NOT NULL,
  `Numero` int(4) NOT NULL,
  `Cidade` varchar(35) NOT NULL,
  `Bairro` varchar(30) NOT NULL,
  `Estado` char(2) NOT NULL,
  `Telefone` varchar(25) NOT NULL,
  `Celular` varchar(25) DEFAULT NULL,
  `Grupo_Sangue` varchar(10) DEFAULT NULL,
  `Doador` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `turmas`
--

CREATE TABLE `turmas` (
  `Codigo_Turma` int(4) NOT NULL,
  `Descricao` varchar(30) NOT NULL,
  `Grau` int(4) NOT NULL,
  `Serie` int(4) NOT NULL,
  `Turno` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `alocacoes`
--
ALTER TABLE `alocacoes`
  ADD PRIMARY KEY (`Codigo_Professor_Aloca`,`Codigo_Turma_Aloca`),
  ADD KEY `Codigo_Turma_Aloca` (`Codigo_Turma_Aloca`);

--
-- Índices de tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`Matricula`);

--
-- Índices de tabela `matriculas`
--
ALTER TABLE `matriculas`
  ADD PRIMARY KEY (`Mat_Aluno`,`Cod_Turma`),
  ADD KEY `Cod_Turma` (`Cod_Turma`);

--
-- Índices de tabela `professores`
--
ALTER TABLE `professores`
  ADD PRIMARY KEY (`Codigo`);

--
-- Índices de tabela `turmas`
--
ALTER TABLE `turmas`
  ADD PRIMARY KEY (`Codigo_Turma`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `alocacoes`
--
ALTER TABLE `alocacoes`
  ADD CONSTRAINT `alocacoes_ibfk_1` FOREIGN KEY (`Codigo_Professor_Aloca`) REFERENCES `professores` (`Codigo`),
  ADD CONSTRAINT `alocacoes_ibfk_2` FOREIGN KEY (`Codigo_Turma_Aloca`) REFERENCES `turmas` (`Codigo_Turma`);

--
-- Restrições para tabelas `matriculas`
--
ALTER TABLE `matriculas`
  ADD CONSTRAINT `matriculas_ibfk_1` FOREIGN KEY (`Mat_Aluno`) REFERENCES `alunos` (`Matricula`),
  ADD CONSTRAINT `matriculas_ibfk_2` FOREIGN KEY (`Cod_Turma`) REFERENCES `turmas` (`Codigo_Turma`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
