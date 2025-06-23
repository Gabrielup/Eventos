TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER Cod_Usuario\n    BEFORE INSERT\n    ON usuarios\n    FOR EACH ROW\nBEGIN\n    DECLARE next_val INT;\n    SET next_val = (SELECT MAX(RIGHT(Cod_Usuario, 5)) + 1 FROM usuarios WHERE Cod_Usuario LIKE \'COD-%\');\n    IF next_val IS NULL THEN\n        SET next_val = 10000;\n    END IF;\n    SET\n        NEW.Cod_Usuario = CONCAT(\'COD-\', LPAD(next_val, 5, \'0\'));\nEND'
sql_modes=1411383296
definers='root@localhost'
client_cs_names='utf8mb3'
connection_cl_names='utf8mb3_general_ci'
db_cl_names='utf8mb4_general_ci'
created=1750656342452886
