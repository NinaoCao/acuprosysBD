-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Jun-2025 às 22:13
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `acuprosys`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `consulta`
--

CREATE TABLE `consulta` (
  `id` int(11) NOT NULL,
  `paciente_id` int(11) DEFAULT NULL,
  `data_consulta` datetime NOT NULL,
  `observacoes` text DEFAULT NULL,
  `lembrete_enviado` tinyint(1) DEFAULT 0,
  `valor_pago` decimal(10,2) DEFAULT 0.00,
  `forma_pagamento` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `consulta`
--

INSERT INTO `consulta` (`id`, `paciente_id`, `data_consulta`, `observacoes`, `lembrete_enviado`, `valor_pago`, `forma_pagamento`) VALUES
(1, 1, '2025-06-04 17:00:14', 'WDADSA', 0, '212300.00', 'Cartão de Débito');

-- --------------------------------------------------------

--
-- Estrutura da tabela `financeiro`
--

CREATE TABLE `financeiro` (
  `id` int(11) NOT NULL,
  `tipo` enum('entrada','saida') NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_lancamento` date NOT NULL,
  `referencia_id` int(11) DEFAULT NULL,
  `paciente_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `foto_paciente`
--

CREATE TABLE `foto_paciente` (
  `id` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  `foto` longblob NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `data_upload` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `paciente`
--

CREATE TABLE `paciente` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `nascimento` date DEFAULT NULL,
  `sexo` enum('Masculino','Feminino','Outro') DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `endereco` text DEFAULT NULL,
  `estado_civil` varchar(50) DEFAULT NULL,
  `profissao` varchar(100) DEFAULT NULL,
  `convenio` varchar(100) DEFAULT NULL,
  `observacoes` text DEFAULT NULL,
  `status_pagamento` enum('Pago','Pagando em parcelas','Em débito') DEFAULT 'Pago',
  `tipo_pagamento` enum('À vista','Parcelado') DEFAULT 'À vista',
  `data_cadastro` datetime DEFAULT current_timestamp(),
  `data_nascimento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `paciente`
--

INSERT INTO `paciente` (`id`, `nome`, `nascimento`, `sexo`, `telefone`, `email`, `endereco`, `estado_civil`, `profissao`, `convenio`, `observacoes`, `status_pagamento`, `tipo_pagamento`, `data_cadastro`, `data_nascimento`) VALUES
(1, 'asdasdasdsa', NULL, '', 'asdasdsadas', 'dasd', 'asdasdasd', '', '', '', '', NULL, NULL, '2025-06-02 16:07:09', '2025-06-02');

-- --------------------------------------------------------

--
-- Estrutura da tabela `prontuario`
--

CREATE TABLE `prontuario` (
  `id` int(11) NOT NULL,
  `paciente_id` int(11) DEFAULT NULL,
  `data_registro` datetime DEFAULT current_timestamp(),
  `queixas` text DEFAULT NULL,
  `diagnostico` text DEFAULT NULL,
  `tratamento` text DEFAULT NULL,
  `pontos_aplicados` text DEFAULT NULL,
  `profissional_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sugestao_tratamento`
--

CREATE TABLE `sugestao_tratamento` (
  `id` int(11) NOT NULL,
  `queixa` varchar(255) DEFAULT NULL,
  `tratamento_sugerido` text DEFAULT NULL,
  `pontos_recomendados` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `tipo` enum('admin','comum') DEFAULT 'comum'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `usuario`, `senha`, `nome`, `tipo`) VALUES
(1, 'admin', 'admin', 'Administrador', 'admin'),
(2, '123', '123', '123', 'comum');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paciente_id` (`paciente_id`);

--
-- Índices para tabela `financeiro`
--
ALTER TABLE `financeiro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paciente_id` (`paciente_id`);

--
-- Índices para tabela `foto_paciente`
--
ALTER TABLE `foto_paciente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paciente_id` (`paciente_id`);

--
-- Índices para tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `prontuario`
--
ALTER TABLE `prontuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paciente_id` (`paciente_id`),
  ADD KEY `profissional_id` (`profissional_id`);

--
-- Índices para tabela `sugestao_tratamento`
--
ALTER TABLE `sugestao_tratamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `financeiro`
--
ALTER TABLE `financeiro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `foto_paciente`
--
ALTER TABLE `foto_paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `prontuario`
--
ALTER TABLE `prontuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sugestao_tratamento`
--
ALTER TABLE `sugestao_tratamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `financeiro`
--
ALTER TABLE `financeiro`
  ADD CONSTRAINT `financeiro_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `foto_paciente`
--
ALTER TABLE `foto_paciente`
  ADD CONSTRAINT `foto_paciente_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `prontuario`
--
ALTER TABLE `prontuario`
  ADD CONSTRAINT `prontuario_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `prontuario_ibfk_2` FOREIGN KEY (`profissional_id`) REFERENCES `usuario` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
