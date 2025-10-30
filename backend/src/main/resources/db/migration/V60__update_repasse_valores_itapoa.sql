-- Migration para atualizar valores de repasse da tabela-valores-itapoa.csv
-- Atualiza apenas registros da unidade 'Bem Estar Saúde - Itapoá'

DO $$
DECLARE
    v_unidade_id BIGINT;
    v_procedimento_id BIGINT;
    v_convenio_id BIGINT;
BEGIN

    -- Buscar ID da unidade 'Bem Estar Saúde - Itapoá'
    SELECT id INTO v_unidade_id FROM unidade WHERE nome ILIKE '%Bem Estar Saúde - Itapoá%' LIMIT 1;

    IF v_unidade_id IS NULL THEN
        RAISE EXCEPTION 'Unidade Bem Estar Saúde - Itapoá não encontrada';
    END IF;

    -- Código TUSS: 40305783 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40305783' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 110.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 110.0, 110.0);
        END IF;
    END IF;

    -- Código TUSS: 40305783 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40305783' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 115.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 115.0, 115.0);
        END IF;
    END IF;

    -- Código TUSS: 40305783 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40305783' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 120.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 120.0, 120.0);
        END IF;
    END IF;

    -- Código TUSS: 40311236 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40311236' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 90.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 90.0, 90.0);
        END IF;
    END IF;

    -- Código TUSS: 40311236 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40311236' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 95.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 95.0, 95.0);
        END IF;
    END IF;

    -- Código TUSS: 40311236 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40311236' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 100.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 100.0, 100.0);
        END IF;
    END IF;

    -- Código TUSS: 40313190 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313190' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 68.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 68.0, 68.0);
        END IF;
    END IF;

    -- Código TUSS: 40313190 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313190' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 73.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 73.0, 73.0);
        END IF;
    END IF;

    -- Código TUSS: 40313190 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313190' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 78.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 78.0, 78.0);
        END IF;
    END IF;

    -- Código TUSS: 40313018 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313018' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 42.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 42.0, 42.0);
        END IF;
    END IF;

    -- Código TUSS: 40313018 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313018' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 47.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 47.0, 47.0);
        END IF;
    END IF;

    -- Código TUSS: 40313018 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313018' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 52.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 52.0, 52.0);
        END IF;
    END IF;

    -- Código TUSS: 50000255 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000255' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 170.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 170.0, 170.0);
        END IF;
    END IF;

    -- Código TUSS: 50000255 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000255' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 175.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 175.0, 175.0);
        END IF;
    END IF;

    -- Código TUSS: 50000255 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000255' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 180.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 180.0, 180.0);
        END IF;
    END IF;

    -- Código TUSS: 40301087 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301087' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 32.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 32.0, 32.0);
        END IF;
    END IF;

    -- Código TUSS: 40301087 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301087' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 37.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 37.0, 37.0);
        END IF;
    END IF;

    -- Código TUSS: 40301087 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301087' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 32.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 32.0, 32.0);
        END IF;
    END IF;

    -- Código TUSS: 40301087 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301087' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 42.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 42.0, 42.0);
        END IF;
    END IF;

    -- Código TUSS: 40313042 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313042' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 18.85
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 18.85, 18.85);
        END IF;
    END IF;

    -- Código TUSS: 40313042 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313042' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 24.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 24.5, 24.5);
        END IF;
    END IF;

    -- Código TUSS: 40313042 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313042' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 32.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 32.0, 32.0);
        END IF;
    END IF;

    -- Código TUSS: 40313050 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313050' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 22.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 22.0, 22.0);
        END IF;
    END IF;

    -- Código TUSS: 40313050 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313050' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 27.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 27.0, 27.0);
        END IF;
    END IF;

    -- Código TUSS: 40313050 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313050' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 32.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 32.0, 32.0);
        END IF;
    END IF;

    -- Código TUSS: 40313069 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313069' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 19.6
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 19.6, 19.6);
        END IF;
    END IF;

    -- Código TUSS: 40313069 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313069' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 24.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 24.5, 24.5);
        END IF;
    END IF;

    -- Código TUSS: 40313069 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313069' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 33.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 33.5, 33.5);
        END IF;
    END IF;

    -- Código TUSS: 40316793 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316793' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 64.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 64.0, 64.0);
        END IF;
    END IF;

    -- Código TUSS: 40316793 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316793' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 69.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 69.0, 69.0);
        END IF;
    END IF;

    -- Código TUSS: 40316793 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316793' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 74.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 74.0, 74.0);
        END IF;
    END IF;

    -- Código TUSS: 40313280 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313280' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 26.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 26.0, 26.0);
        END IF;
    END IF;

    -- Código TUSS: 40313280 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313280' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 31.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 31.0, 31.0);
        END IF;
    END IF;

    -- Código TUSS: 40313280 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313280' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 36.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 36.0, 36.0);
        END IF;
    END IF;

    -- Código TUSS: 40301150 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301150' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 7.2
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 7.2, 7.2);
        END IF;
    END IF;

    -- Código TUSS: 40301150 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301150' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 12.2
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 12.2, 12.2);
        END IF;
    END IF;

    -- Código TUSS: 40301150 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301150' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 8.38
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 8.38, 8.38);
        END IF;
    END IF;

    -- Código TUSS: 40301150 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301150' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 17.2
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 17.2, 17.2);
        END IF;
    END IF;

    -- Código TUSS: 40301222 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301222' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 9.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 9.0, 9.0);
        END IF;
    END IF;

    -- Código TUSS: 40301222 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301222' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 14.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 14.0, 14.0);
        END IF;
    END IF;

    -- Código TUSS: 40301222 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301222' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 19.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 19.0, 19.0);
        END IF;
    END IF;

    -- Código TUSS: 40301230 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301230' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 16.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 16.0, 16.0);
        END IF;
    END IF;

    -- Código TUSS: 40301230 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301230' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 21.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 21.0, 21.0);
        END IF;
    END IF;

    -- Código TUSS: 40301230 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301230' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 26.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 26.0, 26.0);
        END IF;
    END IF;

    -- Código TUSS: 40301257 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301257' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 18.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 18.0, 18.0);
        END IF;
    END IF;

    -- Código TUSS: 40301257 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301257' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 23.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 23.0, 23.0);
        END IF;
    END IF;

    -- Código TUSS: 40301257 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301257' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 38.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 38.0, 38.0);
        END IF;
    END IF;

    -- Código TUSS: 40316068 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316068' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 70.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 70.0, 70.0);
        END IF;
    END IF;

    -- Código TUSS: 40316068 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316068' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 75.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 75.0, 75.0);
        END IF;
    END IF;

    -- Código TUSS: 40316068 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316068' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 80.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 80.0, 80.0);
        END IF;
    END IF;

    -- Código TUSS: 40301281 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301281' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 11.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 11.0, 11.0);
        END IF;
    END IF;

    -- Código TUSS: 40301281 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301281' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 16.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 16.0, 16.0);
        END IF;
    END IF;

    -- Código TUSS: 40301281 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301281' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 11.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 11.0, 11.0);
        END IF;
    END IF;

    -- Código TUSS: 40301281 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301281' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 21.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 21.0, 21.0);
        END IF;
    END IF;

    -- Código TUSS: 40316076 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316076' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 54.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 54.0, 54.0);
        END IF;
    END IF;

    -- Código TUSS: 40316076 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316076' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 59.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 59.0, 59.0);
        END IF;
    END IF;

    -- Código TUSS: 40316076 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316076' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 64.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 64.0, 64.0);
        END IF;
    END IF;

    -- Código TUSS: 50000250 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000250' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 210.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 210.0, 210.0);
        END IF;
    END IF;

    -- Código TUSS: 50000250 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000250' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 215.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 215.0, 215.0);
        END IF;
    END IF;

    -- Código TUSS: 50000250 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000250' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 220.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 220.0, 220.0);
        END IF;
    END IF;

    -- Código TUSS: 40306259 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306259' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 56.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 56.0, 56.0);
        END IF;
    END IF;

    -- Código TUSS: 40306259 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306259' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 61.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 61.0, 61.0);
        END IF;
    END IF;

    -- Código TUSS: 40306259 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306259' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 76.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 76.0, 76.0);
        END IF;
    END IF;

    -- Código TUSS: 50000269 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000269' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 56.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 56.0, 56.0);
        END IF;
    END IF;

    -- Código TUSS: 50000269 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000269' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 61.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 61.0, 61.0);
        END IF;
    END IF;

    -- Código TUSS: 50000269 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000269' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 66.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 66.0, 66.0);
        END IF;
    END IF;

    -- Código TUSS: 50000270 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000270' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 56.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 56.0, 56.0);
        END IF;
    END IF;

    -- Código TUSS: 50000270 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000270' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 61.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 61.0, 61.0);
        END IF;
    END IF;

    -- Código TUSS: 50000270 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000270' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 66.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 66.0, 66.0);
        END IF;
    END IF;

    -- Código TUSS: 40306950 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306950' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 40.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 40.0, 40.0);
        END IF;
    END IF;

    -- Código TUSS: 40306950 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306950' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 45.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 45.0, 45.0);
        END IF;
    END IF;

    -- Código TUSS: 40306950 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306950' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 50.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 50.0, 50.0);
        END IF;
    END IF;

    -- Código TUSS: 40306968 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306968' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 40.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 40.0, 40.0);
        END IF;
    END IF;

    -- Código TUSS: 40306968 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306968' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 45.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 45.0, 45.0);
        END IF;
    END IF;

    -- Código TUSS: 40306968 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306968' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 50.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 50.0, 50.0);
        END IF;
    END IF;

    -- Código TUSS: 40306976 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306976' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 44.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 44.0, 44.0);
        END IF;
    END IF;

    -- Código TUSS: 40306976 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306976' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 49.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 49.0, 49.0);
        END IF;
    END IF;

    -- Código TUSS: 40306976 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306976' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 54.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 54.0, 54.0);
        END IF;
    END IF;

    -- Código TUSS: 40306992 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306992' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 34.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 34.0, 34.0);
        END IF;
    END IF;

    -- Código TUSS: 40306992 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306992' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 39.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 39.0, 39.0);
        END IF;
    END IF;

    -- Código TUSS: 40306992 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306992' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 44.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 44.0, 44.0);
        END IF;
    END IF;

    -- Código TUSS: 40306933 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306933' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 54.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 54.0, 54.0);
        END IF;
    END IF;

    -- Código TUSS: 40306941 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306941' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 40.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 40.0, 40.0);
        END IF;
    END IF;

    -- Código TUSS: 40306941 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306941' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 45.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 45.0, 45.0);
        END IF;
    END IF;

    -- Código TUSS: 40306941 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306941' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 50.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 50.0, 50.0);
        END IF;
    END IF;

    -- Código TUSS: 40308553 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40308553' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 54.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 54.0, 54.0);
        END IF;
    END IF;

    -- Código TUSS: 40308553 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40308553' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 59.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 59.0, 59.0);
        END IF;
    END IF;

    -- Código TUSS: 40308553 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40308553' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 64.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 64.0, 64.0);
        END IF;
    END IF;

    -- Código TUSS: 40310418 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310418' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 16.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 16.0, 16.0);
        END IF;
    END IF;

    -- Código TUSS: 40310418 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310418' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 21.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 21.0, 21.0);
        END IF;
    END IF;

    -- Código TUSS: 40310418 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310418' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 16.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 16.0, 16.0);
        END IF;
    END IF;

    -- Código TUSS: 40310418 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310418' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 26.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 26.0, 26.0);
        END IF;
    END IF;

    -- Código TUSS: 40306305 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306305' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 38.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 38.0, 38.0);
        END IF;
    END IF;

    -- Código TUSS: 40306305 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306305' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 43.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 43.0, 43.0);
        END IF;
    END IF;

    -- Código TUSS: 40306305 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306305' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 48.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 48.0, 48.0);
        END IF;
    END IF;

    -- Código TUSS: 40306313 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306313' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 38.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 38.0, 38.0);
        END IF;
    END IF;

    -- Código TUSS: 40306313 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306313' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 43.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 43.0, 43.0);
        END IF;
    END IF;

    -- Código TUSS: 40306313 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306313' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 38.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 38.0, 38.0);
        END IF;
    END IF;

    -- Código TUSS: 40306313 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306313' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 48.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 48.0, 48.0);
        END IF;
    END IF;

    -- Código TUSS: 40306321 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306321' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 38.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 38.0, 38.0);
        END IF;
    END IF;

    -- Código TUSS: 40306321 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306321' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 43.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 43.0, 43.0);
        END IF;
    END IF;

    -- Código TUSS: 40306321 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306321' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 48.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 48.0, 48.0);
        END IF;
    END IF;

    -- Código TUSS: 40306089 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306089' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 38.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 38.0, 38.0);
        END IF;
    END IF;

    -- Código TUSS: 40306089 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306089' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 43.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 43.0, 43.0);
        END IF;
    END IF;

    -- Código TUSS: 40306089 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306089' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 48.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 48.0, 48.0);
        END IF;
    END IF;

    -- Código TUSS: 40306348 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306348' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 42.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 42.0, 42.0);
        END IF;
    END IF;

    -- Código TUSS: 40306348 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306348' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 47.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 47.0, 47.0);
        END IF;
    END IF;

    -- Código TUSS: 40306348 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306348' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 52.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 52.0, 52.0);
        END IF;
    END IF;

    -- Código TUSS: 40306119 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306119' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 38.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 38.0, 38.0);
        END IF;
    END IF;

    -- Código TUSS: 40306119 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306119' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 43.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 43.0, 43.0);
        END IF;
    END IF;

    -- Código TUSS: 40306119 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306119' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 48.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 48.0, 48.0);
        END IF;
    END IF;

    -- Código TUSS: 40316157 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316157' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 26.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 26.0, 26.0);
        END IF;
    END IF;

    -- Código TUSS: 40316157 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316157' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 31.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 31.0, 31.0);
        END IF;
    END IF;

    -- Código TUSS: 40316157 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316157' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 36.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 36.0, 36.0);
        END IF;
    END IF;

    -- Código TUSS: 40306445 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306445' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 24.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 24.0, 24.0);
        END IF;
    END IF;

    -- Código TUSS: 40306445 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306445' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 29.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 29.0, 29.0);
        END IF;
    END IF;

    -- Código TUSS: 40306445 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306445' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 34.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 34.0, 34.0);
        END IF;
    END IF;

    -- Código TUSS: 40306470 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306470' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 56.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 56.0, 56.0);
        END IF;
    END IF;

    -- Código TUSS: 40306470 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306470' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 61.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 61.0, 61.0);
        END IF;
    END IF;

    -- Código TUSS: 40306470 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306470' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 66.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 66.0, 66.0);
        END IF;
    END IF;

    -- Código TUSS: 50000262 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000262' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 31.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 31.0, 31.0);
        END IF;
    END IF;

    -- Código TUSS: 50000262 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000262' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 36.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 36.0, 36.0);
        END IF;
    END IF;

    -- Código TUSS: 50000262 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000262' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 41.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 41.0, 41.0);
        END IF;
    END IF;

    -- Código TUSS: 40310060 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310060' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 31.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 31.0, 31.0);
        END IF;
    END IF;

    -- Código TUSS: 40310060 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310060' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 36.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 36.0, 36.0);
        END IF;
    END IF;

    -- Código TUSS: 40310060 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310060' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 41.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 41.0, 41.0);
        END IF;
    END IF;

    -- Código TUSS: 40305759 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40305759' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 28.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 28.0, 28.0);
        END IF;
    END IF;

    -- Código TUSS: 40305759 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40305759' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 33.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 33.0, 33.0);
        END IF;
    END IF;

    -- Código TUSS: 40305759 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40305759' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 38.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 38.0, 38.0);
        END IF;
    END IF;

    -- Código TUSS: 40305767 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40305767' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 46.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 46.0, 46.0);
        END IF;
    END IF;

    -- Código TUSS: 40305767 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40305767' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 51.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 51.0, 51.0);
        END IF;
    END IF;

    -- Código TUSS: 40305767 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40305767' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 56.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 56.0, 56.0);
        END IF;
    END IF;

    -- Código TUSS: 40301397 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301397' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 9.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 9.0, 9.0);
        END IF;
    END IF;

    -- Código TUSS: 40301397 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301397' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 14.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 14.0, 14.0);
        END IF;
    END IF;

    -- Código TUSS: 40301397 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301397' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 9.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 9.0, 9.0);
        END IF;
    END IF;

    -- Código TUSS: 40301397 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301397' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 19.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 19.0, 19.0);
        END IF;
    END IF;

    -- Código TUSS: 30101077 | Convênio: VALE +
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '30101077' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 150.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 150.0, 150.0);
        END IF;
    END IF;

    -- Código TUSS: 30101077 | Convênio: MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '30101077' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 160.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 160.0, 160.0);
        END IF;
    END IF;

    -- Código TUSS: 30101077 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '30101077' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 160.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 160.0, 160.0);
        END IF;
    END IF;

    -- Código TUSS: 30101077 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '30101077' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 160.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 160.0, 160.0);
        END IF;
    END IF;

    -- Código TUSS: 30101077 | Convênio: VALE +
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '30101077' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 170.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 170.0, 170.0);
        END IF;
    END IF;

    -- Código TUSS: 30101077 | Convênio: MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '30101077' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 190.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 190.0, 190.0);
        END IF;
    END IF;

    -- Código TUSS: 30101077 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '30101077' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 210.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 210.0, 210.0);
        END IF;
    END IF;

    -- Código TUSS: 30101077 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '30101077' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 240.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 240.0, 240.0);
        END IF;
    END IF;

    -- Código TUSS: 40306500 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306500' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 42.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 42.0, 42.0);
        END IF;
    END IF;

    -- Código TUSS: 40306500 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306500' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 47.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 47.0, 47.0);
        END IF;
    END IF;

    -- Código TUSS: 40306500 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306500' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 52.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 52.0, 52.0);
        END IF;
    END IF;

    -- Código TUSS: 40306518 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306518' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 42.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 42.0, 42.0);
        END IF;
    END IF;

    -- Código TUSS: 40306518 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306518' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 47.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 47.0, 47.0);
        END IF;
    END IF;

    -- Código TUSS: 40306518 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306518' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 52.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 52.0, 52.0);
        END IF;
    END IF;

    -- Código TUSS: 40301400 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301400' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 10.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 10.0, 10.0);
        END IF;
    END IF;

    -- Código TUSS: 40301400 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301400' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 15.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 15.0, 15.0);
        END IF;
    END IF;

    -- Código TUSS: 40301400 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301400' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 20.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 20.0, 20.0);
        END IF;
    END IF;

    -- Código TUSS: 40301419 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301419' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 20.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 20.0, 20.0);
        END IF;
    END IF;

    -- Código TUSS: 40301419 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301419' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 25.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 25.0, 25.0);
        END IF;
    END IF;

    -- Código TUSS: 40301419 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301419' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 30.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 30.0, 30.0);
        END IF;
    END IF;

    -- Código TUSS: 50000257 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000257' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 9.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 9.0, 9.0);
        END IF;
    END IF;

    -- Código TUSS: 50000257 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000257' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 14.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 14.0, 14.0);
        END IF;
    END IF;

    -- Código TUSS: 50000257 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000257' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 9.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 9.0, 9.0);
        END IF;
    END IF;

    -- Código TUSS: 50000257 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000257' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 19.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 19.0, 19.0);
        END IF;
    END IF;

    -- Código TUSS: 40321363 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40321363' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 90.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 90.0, 90.0);
        END IF;
    END IF;

    -- Código TUSS: 40321363 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40321363' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 95.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 95.0, 95.0);
        END IF;
    END IF;

    -- Código TUSS: 40321363 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40321363' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 100.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 100.0, 100.0);
        END IF;
    END IF;

    -- Código TUSS: 40313093 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313093' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 24.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 24.0, 24.0);
        END IF;
    END IF;

    -- Código TUSS: 40313093 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313093' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 29.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 29.0, 29.0);
        END IF;
    END IF;

    -- Código TUSS: 40313093 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313093' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 34.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 34.0, 34.0);
        END IF;
    END IF;

    -- Código TUSS: 40306593 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306593' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 40.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 40.0, 40.0);
        END IF;
    END IF;

    -- Código TUSS: 40306593 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306593' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 45.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 45.0, 45.0);
        END IF;
    END IF;

    -- Código TUSS: 40306593 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306593' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 50.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 50.0, 50.0);
        END IF;
    END IF;

    -- Código TUSS: 40306607 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306607' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 40.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 40.0, 40.0);
        END IF;
    END IF;

    -- Código TUSS: 40306607 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306607' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 45.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 45.0, 45.0);
        END IF;
    END IF;

    -- Código TUSS: 40306607 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306607' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 50.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 50.0, 50.0);
        END IF;
    END IF;

    -- Código TUSS: 40316122 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316122' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 94.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 94.0, 94.0);
        END IF;
    END IF;

    -- Código TUSS: 40316122 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316122' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 99.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 99.0, 99.0);
        END IF;
    END IF;

    -- Código TUSS: 40316122 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316122' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 104.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 104.0, 104.0);
        END IF;
    END IF;

    -- Código TUSS: 40307964 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307964' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 36.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 36.0, 36.0);
        END IF;
    END IF;

    -- Código TUSS: 40307964 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307964' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 41.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 41.0, 41.0);
        END IF;
    END IF;

    -- Código TUSS: 40307964 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307964' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 46.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 46.0, 46.0);
        END IF;
    END IF;

    -- Código TUSS: 40306631 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306631' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 48.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 48.0, 48.0);
        END IF;
    END IF;

    -- Código TUSS: 40306631 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306631' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 53.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 53.0, 53.0);
        END IF;
    END IF;

    -- Código TUSS: 40306631 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306631' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 48.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 48.0, 48.0);
        END IF;
    END IF;

    -- Código TUSS: 40306631 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306631' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 58.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 58.0, 58.0);
        END IF;
    END IF;

    -- Código TUSS: 40306640 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306640' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 48.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 48.0, 48.0);
        END IF;
    END IF;

    -- Código TUSS: 40306640 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306640' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 53.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 53.0, 53.0);
        END IF;
    END IF;

    -- Código TUSS: 40306640 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306640' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 48.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 48.0, 48.0);
        END IF;
    END IF;

    -- Código TUSS: 40306640 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306640' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 58.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 58.0, 58.0);
        END IF;
    END IF;

    -- Código TUSS: 40313107 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313107' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 42.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 42.0, 42.0);
        END IF;
    END IF;

    -- Código TUSS: 40313107 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313107' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 47.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 47.0, 47.0);
        END IF;
    END IF;

    -- Código TUSS: 40313107 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313107' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 52.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 52.0, 52.0);
        END IF;
    END IF;

    -- Código TUSS: 40306658 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306658' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 34.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 34.0, 34.0);
        END IF;
    END IF;

    -- Código TUSS: 40306658 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306658' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 39.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 39.0, 39.0);
        END IF;
    END IF;

    -- Código TUSS: 40306658 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306658' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 44.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 44.0, 44.0);
        END IF;
    END IF;

    -- Código TUSS: 40306666 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306666' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 40.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 40.0, 40.0);
        END IF;
    END IF;

    -- Código TUSS: 40306666 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306666' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 45.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 45.0, 45.0);
        END IF;
    END IF;

    -- Código TUSS: 40306666 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306666' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 50.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 50.0, 50.0);
        END IF;
    END IF;

    -- Código TUSS: 40306674 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306674' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 36.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 36.0, 36.0);
        END IF;
    END IF;

    -- Código TUSS: 40306674 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306674' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 41.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 41.0, 41.0);
        END IF;
    END IF;

    -- Código TUSS: 40306674 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306674' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 46.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 46.0, 46.0);
        END IF;
    END IF;

    -- Código TUSS: 40301508 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301508' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 24.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 24.0, 24.0);
        END IF;
    END IF;

    -- Código TUSS: 40301508 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301508' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 29.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 29.0, 29.0);
        END IF;
    END IF;

    -- Código TUSS: 40301508 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301508' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 24.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 24.0, 24.0);
        END IF;
    END IF;

    -- Código TUSS: 40301508 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301508' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 34.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 34.0, 34.0);
        END IF;
    END IF;

    -- Código TUSS: 40312046 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40312046' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 8.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 8.0, 8.0);
        END IF;
    END IF;

    -- Código TUSS: 40312046 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40312046' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 13.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 13.0, 13.0);
        END IF;
    END IF;

    -- Código TUSS: 40312046 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40312046' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 18.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 18.0, 18.0);
        END IF;
    END IF;

    -- Código TUSS: 40304922 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304922' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 42.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 42.0, 42.0);
        END IF;
    END IF;

    -- Código TUSS: 40304922 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304922' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 47.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 47.0, 47.0);
        END IF;
    END IF;

    -- Código TUSS: 40304922 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304922' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 42.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 42.0, 42.0);
        END IF;
    END IF;

    -- Código TUSS: 40304922 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304922' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 52.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 52.0, 52.0);
        END IF;
    END IF;

    -- Código TUSS: 40301567 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301567' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 32.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 32.0, 32.0);
        END IF;
    END IF;

    -- Código TUSS: 40301567 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301567' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 37.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 37.0, 37.0);
        END IF;
    END IF;

    -- Código TUSS: 40301567 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301567' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 42.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 42.0, 42.0);
        END IF;
    END IF;

    -- Código TUSS: 40301605 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301605' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 8.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 8.0, 8.0);
        END IF;
    END IF;

    -- Código TUSS: 40301605 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301605' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 13.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 13.0, 13.0);
        END IF;
    END IF;

    -- Código TUSS: 40301605 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301605' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 8.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 8.0, 8.0);
        END IF;
    END IF;

    -- Código TUSS: 40301605 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301605' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 18.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 18.0, 18.0);
        END IF;
    END IF;

    -- Código TUSS: 50000254 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000254' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 52.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 52.0, 52.0);
        END IF;
    END IF;

    -- Código TUSS: 50000254 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000254' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 57.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 57.0, 57.0);
        END IF;
    END IF;

    -- Código TUSS: 50000254 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000254' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 62.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 62.0, 62.0);
        END IF;
    END IF;

    -- Código TUSS: 40302695 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302695' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 16.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 16.0, 16.0);
        END IF;
    END IF;

    -- Código TUSS: 40302695 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302695' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 21.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 21.0, 21.0);
        END IF;
    END IF;

    -- Código TUSS: 40302695 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302695' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 16.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 16.0, 16.0);
        END IF;
    END IF;

    -- Código TUSS: 40302695 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302695' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 26.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 26.0, 26.0);
        END IF;
    END IF;

    -- Código TUSS: 40313115 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313115' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 25.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 25.0, 25.0);
        END IF;
    END IF;

    -- Código TUSS: 40313115 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313115' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 28.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 28.0, 28.0);
        END IF;
    END IF;

    -- Código TUSS: 40313115 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313115' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 38.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 38.0, 38.0);
        END IF;
    END IF;

    -- Código TUSS: 40306704 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306704' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 26.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 26.0, 26.0);
        END IF;
    END IF;

    -- Código TUSS: 40306704 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306704' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 31.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 31.0, 31.0);
        END IF;
    END IF;

    -- Código TUSS: 40306704 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306704' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 36.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 36.0, 36.0);
        END IF;
    END IF;

    -- Código TUSS: 40306712 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306712' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 26.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 26.0, 26.0);
        END IF;
    END IF;

    -- Código TUSS: 40306712 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306712' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 31.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 31.0, 31.0);
        END IF;
    END IF;

    -- Código TUSS: 40306712 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306712' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 36.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 36.0, 36.0);
        END IF;
    END IF;

    -- Código TUSS: 40304108 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304108' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 12.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 12.0, 12.0);
        END IF;
    END IF;

    -- Código TUSS: 40304108 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304108' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 17.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 17.0, 17.0);
        END IF;
    END IF;

    -- Código TUSS: 40304108 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304108' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 22.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 22.0, 22.0);
        END IF;
    END IF;

    -- Código TUSS: 40304884 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304884' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 12.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 12.0, 12.0);
        END IF;
    END IF;

    -- Código TUSS: 40304884 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304884' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 17.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 17.0, 17.0);
        END IF;
    END IF;

    -- Código TUSS: 40304884 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304884' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 12.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 12.0, 12.0);
        END IF;
    END IF;

    -- Código TUSS: 40304884 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304884' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 22.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 22.0, 22.0);
        END IF;
    END IF;

    -- Código TUSS: 40303039 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40303039' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 48.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 48.0, 48.0);
        END IF;
    END IF;

    -- Código TUSS: 40303039 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40303039' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 53.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 53.0, 53.0);
        END IF;
    END IF;

    -- Código TUSS: 40303039 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40303039' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 58.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 58.0, 58.0);
        END IF;
    END IF;

    -- Código TUSS: 40316190 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316190' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 34.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 34.0, 34.0);
        END IF;
    END IF;

    -- Código TUSS: 40316190 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316190' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 39.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 39.0, 39.0);
        END IF;
    END IF;

    -- Código TUSS: 40316190 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316190' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 44.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 44.0, 44.0);
        END IF;
    END IF;

    -- Código TUSS: 40301630 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301630' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 10.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 10.0, 10.0);
        END IF;
    END IF;

    -- Código TUSS: 40301630 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301630' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 15.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 15.0, 15.0);
        END IF;
    END IF;

    -- Código TUSS: 40301630 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301630' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 20.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 20.0, 20.0);
        END IF;
    END IF;

    -- Código TUSS: 40301664 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301664' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 22.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 22.0, 22.0);
        END IF;
    END IF;

    -- Código TUSS: 40301664 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301664' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 27.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 27.0, 27.0);
        END IF;
    END IF;

    -- Código TUSS: 40301664 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301664' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 22.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 22.0, 22.0);
        END IF;
    END IF;

    -- Código TUSS: 40301664 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301664' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 32.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 32.0, 32.0);
        END IF;
    END IF;

    -- Código TUSS: 40301656 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301656' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 22.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 22.0, 22.0);
        END IF;
    END IF;

    -- Código TUSS: 40301656 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301656' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 27.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 27.0, 27.0);
        END IF;
    END IF;

    -- Código TUSS: 40301656 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301656' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 22.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 22.0, 22.0);
        END IF;
    END IF;

    -- Código TUSS: 40301656 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301656' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 32.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 32.0, 32.0);
        END IF;
    END IF;

    -- Código TUSS: 40313310 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313310' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 40.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 40.0, 40.0);
        END IF;
    END IF;

    -- Código TUSS: 40313310 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313310' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 45.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 45.0, 45.0);
        END IF;
    END IF;

    -- Código TUSS: 40313310 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313310' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 50.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 50.0, 50.0);
        END IF;
    END IF;

    -- Código TUSS: 40310078 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310078' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 52.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 52.0, 52.0);
        END IF;
    END IF;

    -- Código TUSS: 40310078 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310078' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 57.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 57.0, 57.0);
        END IF;
    END IF;

    -- Código TUSS: 40310078 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310078' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 62.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 62.0, 62.0);
        END IF;
    END IF;

    -- Código TUSS: 50000240 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000240' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 52.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 52.0, 52.0);
        END IF;
    END IF;

    -- Código TUSS: 50000240 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000240' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 57.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 57.0, 57.0);
        END IF;
    END IF;

    -- Código TUSS: 50000240 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000240' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 62.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 62.0, 62.0);
        END IF;
    END IF;

    -- Código TUSS: 50000241 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000241' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 52.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 52.0, 52.0);
        END IF;
    END IF;

    -- Código TUSS: 50000241 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000241' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 57.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 57.0, 57.0);
        END IF;
    END IF;

    -- Código TUSS: 50000241 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000241' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 62.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 62.0, 62.0);
        END IF;
    END IF;

    -- Código TUSS: 40310221 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310221' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 52.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 52.0, 52.0);
        END IF;
    END IF;

    -- Código TUSS: 40310221 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310221' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 57.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 57.0, 57.0);
        END IF;
    END IF;

    -- Código TUSS: 40310221 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310221' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 62.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 62.0, 62.0);
        END IF;
    END IF;

    -- Código TUSS: 40310124 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310124' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 36.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 36.0, 36.0);
        END IF;
    END IF;

    -- Código TUSS: 40310124 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310124' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 41.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 41.0, 41.0);
        END IF;
    END IF;

    -- Código TUSS: 40310124 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310124' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 46.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 46.0, 46.0);
        END IF;
    END IF;

    -- Código TUSS: 50000453 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000453' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 16.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 16.0, 16.0);
        END IF;
    END IF;

    -- Código TUSS: 50000453 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000453' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 21.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 21.0, 21.0);
        END IF;
    END IF;

    -- Código TUSS: 50000453 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000453' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 26.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 26.0, 26.0);
        END IF;
    END IF;

    -- Código TUSS: 40310183 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310183' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 16.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 16.0, 16.0);
        END IF;
    END IF;

    -- Código TUSS: 40310183 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310183' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 21.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 21.0, 21.0);
        END IF;
    END IF;

    -- Código TUSS: 40310183 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310183' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 26.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 26.0, 26.0);
        END IF;
    END IF;

    -- Código TUSS: 50000243 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000243' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 52.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 52.0, 52.0);
        END IF;
    END IF;

    -- Código TUSS: 50000243 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000243' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 57.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 57.0, 57.0);
        END IF;
    END IF;

    -- Código TUSS: 50000243 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000243' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 62.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 62.0, 62.0);
        END IF;
    END IF;

    -- Código TUSS: 50000244 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000244' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 52.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 52.0, 52.0);
        END IF;
    END IF;

    -- Código TUSS: 50000244 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000244' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 57.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 57.0, 57.0);
        END IF;
    END IF;

    -- Código TUSS: 50000244 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000244' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 62.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 62.0, 62.0);
        END IF;
    END IF;

    -- Código TUSS: 40310140 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310140' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 40.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 40.0, 40.0);
        END IF;
    END IF;

    -- Código TUSS: 40310140 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310140' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 45.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 45.0, 45.0);
        END IF;
    END IF;

    -- Código TUSS: 40310140 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310140' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 50.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 50.0, 50.0);
        END IF;
    END IF;

    -- Código TUSS: 50000245 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000245' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 52.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 52.0, 52.0);
        END IF;
    END IF;

    -- Código TUSS: 50000245 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000245' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 57.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 57.0, 57.0);
        END IF;
    END IF;

    -- Código TUSS: 50000245 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000245' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 62.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 62.0, 62.0);
        END IF;
    END IF;

    -- Código TUSS: 50000246 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000246' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 50.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 50.0, 50.0);
        END IF;
    END IF;

    -- Código TUSS: 50000246 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000246' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 55.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 55.0, 55.0);
        END IF;
    END IF;

    -- Código TUSS: 50000246 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000246' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 60.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 60.0, 60.0);
        END IF;
    END IF;

    -- Código TUSS: 40310205 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310205' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 50.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 50.0, 50.0);
        END IF;
    END IF;

    -- Código TUSS: 40310205 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310205' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 55.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 55.0, 55.0);
        END IF;
    END IF;

    -- Código TUSS: 40310205 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310205' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 50.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 50.0, 50.0);
        END IF;
    END IF;

    -- Código TUSS: 40310205 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310205' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 60.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 60.0, 60.0);
        END IF;
    END IF;

    -- Código TUSS: 40301680 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301680' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 70.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 70.0, 70.0);
        END IF;
    END IF;

    -- Código TUSS: 40301680 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301680' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 75.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 75.0, 75.0);
        END IF;
    END IF;

    -- Código TUSS: 40301680 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301680' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 80.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 80.0, 80.0);
        END IF;
    END IF;

    -- Código TUSS: 50000247 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000247' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 154.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 154.0, 154.0);
        END IF;
    END IF;

    -- Código TUSS: 50000247 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000247' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 159.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 159.0, 159.0);
        END IF;
    END IF;

    -- Código TUSS: 50000247 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000247' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 164.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 164.0, 164.0);
        END IF;
    END IF;

    -- Código TUSS: 40301729 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301729' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 16.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 16.0, 16.0);
        END IF;
    END IF;

    -- Código TUSS: 40301729 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301729' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 21.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 21.0, 21.0);
        END IF;
    END IF;

    -- Código TUSS: 40301729 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301729' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 16.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 16.0, 16.0);
        END IF;
    END IF;

    -- Código TUSS: 40301729 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301729' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 26.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 26.0, 26.0);
        END IF;
    END IF;

    -- Código TUSS: 40316211 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316211' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 50.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 50.0, 50.0);
        END IF;
    END IF;

    -- Código TUSS: 40316211 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316211' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 55.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 55.0, 55.0);
        END IF;
    END IF;

    -- Código TUSS: 40316211 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316211' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 60.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 60.0, 60.0);
        END IF;
    END IF;

    -- Código TUSS: 40301761 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301761' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 26.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 26.0, 26.0);
        END IF;
    END IF;

    -- Código TUSS: 40301761 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301761' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 31.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 31.0, 31.0);
        END IF;
    END IF;

    -- Código TUSS: 40301761 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301761' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 36.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 36.0, 36.0);
        END IF;
    END IF;

    -- Código TUSS: 40304353 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304353' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 38.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 38.0, 38.0);
        END IF;
    END IF;

    -- Código TUSS: 40304353 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304353' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 43.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 43.0, 43.0);
        END IF;
    END IF;

    -- Código TUSS: 40304353 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304353' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 48.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 48.0, 48.0);
        END IF;
    END IF;

    -- Código TUSS: 40311210 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40311210' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 10.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 10.0, 10.0);
        END IF;
    END IF;

    -- Código TUSS: 40311210 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40311210' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 15.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 15.0, 15.0);
        END IF;
    END IF;

    -- Código TUSS: 40311210 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40311210' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 20.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 20.0, 20.0);
        END IF;
    END IF;

    -- Código TUSS: 40309312 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40309312' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 100.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 100.0, 100.0);
        END IF;
    END IF;

    -- Código TUSS: 40309312 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40309312' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 105.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 105.0, 105.0);
        END IF;
    END IF;

    -- Código TUSS: 40309312 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40309312' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 110.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 110.0, 110.0);
        END IF;
    END IF;

    -- Código TUSS: 40316246 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316246' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 40.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 40.0, 40.0);
        END IF;
    END IF;

    -- Código TUSS: 40316246 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316246' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 45.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 45.0, 45.0);
        END IF;
    END IF;

    -- Código TUSS: 40316246 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316246' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 50.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 50.0, 50.0);
        END IF;
    END IF;

    -- Código TUSS: 40316254 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316254' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 32.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 32.0, 32.0);
        END IF;
    END IF;

    -- Código TUSS: 40316254 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316254' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 37.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 37.0, 37.0);
        END IF;
    END IF;

    -- Código TUSS: 40316254 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316254' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 50.72
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 50.72, 50.72);
        END IF;
    END IF;

    -- Código TUSS: 40316254 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316254' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 42.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 42.0, 42.0);
        END IF;
    END IF;

    -- Código TUSS: 40316262 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316262' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 32.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 32.0, 32.0);
        END IF;
    END IF;

    -- Código TUSS: 40316262 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316262' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 37.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 37.0, 37.0);
        END IF;
    END IF;

    -- Código TUSS: 40316262 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316262' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 42.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 42.0, 42.0);
        END IF;
    END IF;

    -- Código TUSS: 40313140 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313140' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 50.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 50.0, 50.0);
        END IF;
    END IF;

    -- Código TUSS: 40313140 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313140' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 55.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 55.0, 55.0);
        END IF;
    END IF;

    -- Código TUSS: 40313140 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313140' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 60.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 60.0, 60.0);
        END IF;
    END IF;

    -- Código TUSS: 40306852 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306852' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 18.4
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 18.4, 18.4);
        END IF;
    END IF;

    -- Código TUSS: 40306852 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306852' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 23.4
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 23.4, 23.4);
        END IF;
    END IF;

    -- Código TUSS: 40306852 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306852' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 28.4
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 28.4, 28.4);
        END IF;
    END IF;

    -- Código TUSS: 40308030 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40308030' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 12.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 12.0, 12.0);
        END IF;
    END IF;

    -- Código TUSS: 40308030 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40308030' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 17.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 17.0, 17.0);
        END IF;
    END IF;

    -- Código TUSS: 40308030 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40308030' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 22.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 22.0, 22.0);
        END IF;
    END IF;

    -- Código TUSS: 40306860 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306860' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 12.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 12.0, 12.0);
        END IF;
    END IF;

    -- Código TUSS: 40306860 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306860' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 17.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 17.0, 17.0);
        END IF;
    END IF;

    -- Código TUSS: 40306860 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306860' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 22.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 22.0, 22.0);
        END IF;
    END IF;

    -- Código TUSS: 40403173 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40403173' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 4.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 4.0, 4.0);
        END IF;
    END IF;

    -- Código TUSS: 40403173 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40403173' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 9.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 9.0, 9.0);
        END IF;
    END IF;

    -- Código TUSS: 40403173 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40403173' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 14.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 14.0, 14.0);
        END IF;
    END IF;

    -- Código TUSS: 40313158 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313158' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 32.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 32.0, 32.0);
        END IF;
    END IF;

    -- Código TUSS: 40313158 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313158' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 37.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 37.0, 37.0);
        END IF;
    END IF;

    -- Código TUSS: 40313158 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313158' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 42.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 42.0, 42.0);
        END IF;
    END IF;

    -- Código TUSS: 40316270 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316270' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 36.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 36.0, 36.0);
        END IF;
    END IF;

    -- Código TUSS: 40316270 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316270' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 41.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 41.0, 41.0);
        END IF;
    END IF;

    -- Código TUSS: 40316270 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316270' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 36.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 36.0, 36.0);
        END IF;
    END IF;

    -- Código TUSS: 40316270 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316270' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 46.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 46.0, 46.0);
        END IF;
    END IF;

    -- Código TUSS: 40301842 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301842' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 10.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 10.0, 10.0);
        END IF;
    END IF;

    -- Código TUSS: 40301842 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301842' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 15.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 15.0, 15.0);
        END IF;
    END IF;

    -- Código TUSS: 40301842 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301842' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 10.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 10.0, 10.0);
        END IF;
    END IF;

    -- Código TUSS: 40301842 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301842' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 20.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 20.0, 20.0);
        END IF;
    END IF;

    -- Código TUSS: 40313166 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313166' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 32.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 32.0, 32.0);
        END IF;
    END IF;

    -- Código TUSS: 40313166 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313166' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 37.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 37.0, 37.0);
        END IF;
    END IF;

    -- Código TUSS: 40313166 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313166' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 42.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 42.0, 42.0);
        END IF;
    END IF;

    -- Código TUSS: 40301850 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301850' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 38.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 38.0, 38.0);
        END IF;
    END IF;

    -- Código TUSS: 40301850 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301850' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 43.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 43.0, 43.0);
        END IF;
    END IF;

    -- Código TUSS: 40301850 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301850' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 48.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 48.0, 48.0);
        END IF;
    END IF;

    -- Código TUSS: 40301885 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301885' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 8.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 8.5, 8.5);
        END IF;
    END IF;

    -- Código TUSS: 40301885 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301885' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 13.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 13.5, 13.5);
        END IF;
    END IF;

    -- Código TUSS: 40301885 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301885' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 8.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 8.5, 8.5);
        END IF;
    END IF;

    -- Código TUSS: 40301885 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301885' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 18.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 18.5, 18.5);
        END IF;
    END IF;

    -- Código TUSS: 40301923 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301923' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 24.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 24.0, 24.0);
        END IF;
    END IF;

    -- Código TUSS: 40301923 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301923' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 29.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 29.0, 29.0);
        END IF;
    END IF;

    -- Código TUSS: 40301923 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301923' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 34.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 34.0, 34.0);
        END IF;
    END IF;

    -- Código TUSS: 40301931 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301931' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 10.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 10.0, 10.0);
        END IF;
    END IF;

    -- Código TUSS: 40301931 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301931' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 15.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 15.0, 15.0);
        END IF;
    END IF;

    -- Código TUSS: 40301931 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301931' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 20.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 20.0, 20.0);
        END IF;
    END IF;

    -- Código TUSS: 40301958 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301958' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 16.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 16.0, 16.0);
        END IF;
    END IF;

    -- Código TUSS: 40301958 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301958' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 21.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 21.0, 21.0);
        END IF;
    END IF;

    -- Código TUSS: 40301958 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301958' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 26.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 26.0, 26.0);
        END IF;
    END IF;

    -- Código TUSS: 40316289 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316289' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 30.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 30.0, 30.0);
        END IF;
    END IF;

    -- Código TUSS: 40316289 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316289' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 35.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 35.0, 35.0);
        END IF;
    END IF;

    -- Código TUSS: 40316289 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316289' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 30.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 30.0, 30.0);
        END IF;
    END IF;

    -- Código TUSS: 40316289 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316289' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 40.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 40.0, 40.0);
        END IF;
    END IF;

    -- Código TUSS: 40307735 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307735' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 44.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 44.0, 44.0);
        END IF;
    END IF;

    -- Código TUSS: 40307735 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307735' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 49.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 49.0, 49.0);
        END IF;
    END IF;

    -- Código TUSS: 40307735 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307735' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 54.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 54.0, 54.0);
        END IF;
    END IF;

    -- Código TUSS: 40307743 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307743' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 44.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 44.0, 44.0);
        END IF;
    END IF;

    -- Código TUSS: 40307743 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307743' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 49.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 49.0, 49.0);
        END IF;
    END IF;

    -- Código TUSS: 40307743 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307743' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 54.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 54.0, 54.0);
        END IF;
    END IF;

    -- Código TUSS: 40301990 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301990' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 10.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 10.0, 10.0);
        END IF;
    END IF;

    -- Código TUSS: 40301990 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301990' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 15.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 15.0, 15.0);
        END IF;
    END IF;

    -- Código TUSS: 40301990 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301990' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 10.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 10.0, 10.0);
        END IF;
    END IF;

    -- Código TUSS: 40301990 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301990' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 20.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 20.0, 20.0);
        END IF;
    END IF;

    -- Código TUSS: 40302032 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302032' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 46.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 46.0, 46.0);
        END IF;
    END IF;

    -- Código TUSS: 40302032 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302032' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 51.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 51.0, 51.0);
        END IF;
    END IF;

    -- Código TUSS: 40302032 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302032' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 49.08
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 49.08, 49.08);
        END IF;
    END IF;

    -- Código TUSS: 40302032 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302032' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 56.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 56.0, 56.0);
        END IF;
    END IF;

    -- Código TUSS: 40302040 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302040' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 9.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 9.0, 9.0);
        END IF;
    END IF;

    -- Código TUSS: 40302040 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302040' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 14.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 14.5, 14.5);
        END IF;
    END IF;

    -- Código TUSS: 40302040 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302040' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 9.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 9.5, 9.5);
        END IF;
    END IF;

    -- Código TUSS: 40302040 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302040' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 19.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 19.5, 19.5);
        END IF;
    END IF;

    -- Código TUSS: 40303055 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40303055' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 10.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 10.0, 10.0);
        END IF;
    END IF;

    -- Código TUSS: 40303055 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40303055' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 15.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 15.0, 15.0);
        END IF;
    END IF;

    -- Código TUSS: 40303055 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40303055' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 20.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 20.0, 20.0);
        END IF;
    END IF;

    -- Código TUSS: 40304280 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304280' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 4.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 4.0, 4.0);
        END IF;
    END IF;

    -- Código TUSS: 40304280 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304280' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 9.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 9.0, 9.0);
        END IF;
    END IF;

    -- Código TUSS: 40304280 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304280' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 10.29
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 10.29, 10.29);
        END IF;
    END IF;

    -- Código TUSS: 40304280 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304280' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 14.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 14.0, 14.0);
        END IF;
    END IF;

    -- Código TUSS: 40306984 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306984' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 44.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 44.0, 44.0);
        END IF;
    END IF;

    -- Código TUSS: 40306984 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306984' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 49.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 49.0, 49.0);
        END IF;
    END IF;

    -- Código TUSS: 40306984 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40306984' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 54.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 54.0, 54.0);
        END IF;
    END IF;

    -- Código TUSS: 40316114 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316114' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 28.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 28.0, 28.0);
        END IF;
    END IF;

    -- Código TUSS: 40316114 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316114' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 33.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 33.0, 33.0);
        END IF;
    END IF;

    -- Código TUSS: 40316114 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316114' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 38.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 38.0, 38.0);
        END IF;
    END IF;

    -- Código TUSS: 40307018 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307018' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 28.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 28.0, 28.0);
        END IF;
    END IF;

    -- Código TUSS: 40307018 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307018' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 33.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 33.0, 33.0);
        END IF;
    END IF;

    -- Código TUSS: 40307018 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307018' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 28.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 28.0, 28.0);
        END IF;
    END IF;

    -- Código TUSS: 40307018 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307018' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 38.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 38.0, 38.0);
        END IF;
    END IF;

    -- Código TUSS: 40301583 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301583' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 10.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 10.0, 10.0);
        END IF;
    END IF;

    -- Código TUSS: 40301583 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301583' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 15.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 15.0, 15.0);
        END IF;
    END IF;

    -- Código TUSS: 40301583 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301583' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 11.37
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 11.37, 11.37);
        END IF;
    END IF;

    -- Código TUSS: 40301583 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301583' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 20.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 20.0, 20.0);
        END IF;
    END IF;

    -- Código TUSS: 40310248 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310248' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 56.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 56.0, 56.0);
        END IF;
    END IF;

    -- Código TUSS: 40310248 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310248' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 61.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 61.0, 61.0);
        END IF;
    END IF;

    -- Código TUSS: 40310248 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310248' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 66.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 66.0, 66.0);
        END IF;
    END IF;

    -- Código TUSS: 40302733 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302733' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 26.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 26.0, 26.0);
        END IF;
    END IF;

    -- Código TUSS: 40302733 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302733' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 31.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 31.0, 31.0);
        END IF;
    END IF;

    -- Código TUSS: 40302733 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302733' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 26.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 26.0, 26.0);
        END IF;
    END IF;

    -- Código TUSS: 40302733 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302733' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 36.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 36.0, 36.0);
        END IF;
    END IF;

    -- Código TUSS: 40304361 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304361' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 18.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 18.0, 18.0);
        END IF;
    END IF;

    -- Código TUSS: 40304361 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304361' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 22.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 22.0, 22.0);
        END IF;
    END IF;

    -- Código TUSS: 40304361 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304361' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 14.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 14.0, 14.0);
        END IF;
    END IF;

    -- Código TUSS: 40304361 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304361' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 28.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 28.0, 28.0);
        END IF;
    END IF;

    -- Código TUSS: 40307026 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307026' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 60.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 60.0, 60.0);
        END IF;
    END IF;

    -- Código TUSS: 40307026 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307026' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 65.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 65.0, 65.0);
        END IF;
    END IF;

    -- Código TUSS: 40307026 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307026' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 60.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 60.0, 60.0);
        END IF;
    END IF;

    -- Código TUSS: 40307026 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307026' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 70.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 70.0, 70.0);
        END IF;
    END IF;

    -- Código TUSS: 40307085 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307085' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 78.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 78.0, 78.0);
        END IF;
    END IF;

    -- Código TUSS: 40307085 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307085' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 83.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 83.0, 83.0);
        END IF;
    END IF;

    -- Código TUSS: 40307085 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307085' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 88.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 88.0, 88.0);
        END IF;
    END IF;

    -- Código TUSS: 40307093 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307093' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 78.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 78.0, 78.0);
        END IF;
    END IF;

    -- Código TUSS: 40307093 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307093' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 83.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 83.0, 83.0);
        END IF;
    END IF;

    -- Código TUSS: 40307093 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307093' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 88.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 88.0, 88.0);
        END IF;
    END IF;

    -- Código TUSS: 40307174 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307174' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 44.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 44.0, 44.0);
        END IF;
    END IF;

    -- Código TUSS: 40307174 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307174' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 49.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 49.0, 49.0);
        END IF;
    END IF;

    -- Código TUSS: 40307174 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307174' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 46.68
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 46.68, 46.68);
        END IF;
    END IF;

    -- Código TUSS: 40307174 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307174' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 54.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 54.0, 54.0);
        END IF;
    END IF;

    -- Código TUSS: 40302113 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302113' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 76.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 76.0, 76.0);
        END IF;
    END IF;

    -- Código TUSS: 40302113 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302113' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 81.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 81.0, 81.0);
        END IF;
    END IF;

    -- Código TUSS: 40302113 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302113' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 86.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 86.0, 86.0);
        END IF;
    END IF;

    -- Código TUSS: 40307263 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307263' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 11.97
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 11.97, 11.97);
        END IF;
    END IF;

    -- Código TUSS: 40307271 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307271' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 34.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 34.0, 34.0);
        END IF;
    END IF;

    -- Código TUSS: 40307271 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307271' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 39.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 39.0, 39.0);
        END IF;
    END IF;

    -- Código TUSS: 40307271 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307271' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 34.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 34.0, 34.0);
        END IF;
    END IF;

    -- Código TUSS: 40307271 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307271' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 44.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 44.0, 44.0);
        END IF;
    END IF;

    -- Código TUSS: 40307972 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307972' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 40.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 40.0, 40.0);
        END IF;
    END IF;

    -- Código TUSS: 40307972 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307972' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 45.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 45.0, 45.0);
        END IF;
    END IF;

    -- Código TUSS: 40307972 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307972' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 50.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 50.0, 50.0);
        END IF;
    END IF;

    -- Código TUSS: 40321231 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40321231' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 22.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 22.0, 22.0);
        END IF;
    END IF;

    -- Código TUSS: 40321231 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40321231' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 27.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 27.0, 27.0);
        END IF;
    END IF;

    -- Código TUSS: 40321231 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40321231' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 32.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 32.0, 32.0);
        END IF;
    END IF;

    -- Código TUSS: 40316360 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316360' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 30.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 30.0, 30.0);
        END IF;
    END IF;

    -- Código TUSS: 40316360 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316360' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 35.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 35.0, 35.0);
        END IF;
    END IF;

    -- Código TUSS: 40316360 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316360' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 40.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 40.0, 40.0);
        END IF;
    END IF;

    -- Código TUSS: 40304639 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304639' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 20.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 20.0, 20.0);
        END IF;
    END IF;

    -- Código TUSS: 40304639 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304639' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 25.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 25.0, 25.0);
        END IF;
    END IF;

    -- Código TUSS: 40304639 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304639' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 30.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 30.0, 30.0);
        END IF;
    END IF;

    -- Código TUSS: 40302164 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302164' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 50.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 50.0, 50.0);
        END IF;
    END IF;

    -- Código TUSS: 40302164 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302164' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 55.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 55.0, 55.0);
        END IF;
    END IF;

    -- Código TUSS: 40302164 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302164' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 60.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 60.0, 60.0);
        END IF;
    END IF;

    -- Código TUSS: 40304116 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304116' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 10.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 10.0, 10.0);
        END IF;
    END IF;

    -- Código TUSS: 40304116 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304116' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 15.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 15.0, 15.0);
        END IF;
    END IF;

    -- Código TUSS: 40304116 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304116' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 20.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 20.0, 20.0);
        END IF;
    END IF;

    -- Código TUSS: 40301591 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301591' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 12.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 12.0, 12.0);
        END IF;
    END IF;

    -- Código TUSS: 40301591 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301591' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 17.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 17.0, 17.0);
        END IF;
    END IF;

    -- Código TUSS: 40301591 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301591' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 13.65
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 13.65, 13.65);
        END IF;
    END IF;

    -- Código TUSS: 40301591 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40301591' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 22.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 22.0, 22.0);
        END IF;
    END IF;

    -- Código TUSS: 40303098 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40303098' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 16.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 16.5, 16.5);
        END IF;
    END IF;

    -- Código TUSS: 40303098 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40303098' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 21.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 21.5, 21.5);
        END IF;
    END IF;

    -- Código TUSS: 40303098 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40303098' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 26.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 26.5, 26.5);
        END IF;
    END IF;

    -- Código TUSS: 40316335 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316335' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 30.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 30.0, 30.0);
        END IF;
    END IF;

    -- Código TUSS: 40316335 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316335' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 35.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 35.0, 35.0);
        END IF;
    END IF;

    -- Código TUSS: 40316335 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316335' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 40.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 40.0, 40.0);
        END IF;
    END IF;

    -- Código TUSS: 40302199 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302199' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 14.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 14.5, 14.5);
        END IF;
    END IF;

    -- Código TUSS: 40302199 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302199' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 19.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 19.5, 19.5);
        END IF;
    END IF;

    -- Código TUSS: 40302199 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302199' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 24.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 24.5, 24.5);
        END IF;
    END IF;

    -- Código TUSS: 40302210 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302210' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 48.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 48.0, 48.0);
        END IF;
    END IF;

    -- Código TUSS: 40302210 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302210' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 53.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 53.0, 53.0);
        END IF;
    END IF;

    -- Código TUSS: 40302210 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302210' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 58.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 58.0, 58.0);
        END IF;
    END IF;

    -- Código TUSS: 40302229 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302229' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 30.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 30.0, 30.0);
        END IF;
    END IF;

    -- Código TUSS: 40302229 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302229' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 35.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 35.0, 35.0);
        END IF;
    END IF;

    -- Código TUSS: 40302229 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302229' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 40.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 40.0, 40.0);
        END IF;
    END IF;

    -- Código TUSS: 40305775 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40305775' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 56.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 56.0, 56.0);
        END IF;
    END IF;

    -- Código TUSS: 40305775 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40305775' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 61.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 61.0, 61.0);
        END IF;
    END IF;

    -- Código TUSS: 40305775 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40305775' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 66.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 66.0, 66.0);
        END IF;
    END IF;

    -- Código TUSS: 40302237 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302237' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 11.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 11.0, 11.0);
        END IF;
    END IF;

    -- Código TUSS: 40302237 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302237' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 16.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 16.0, 16.0);
        END IF;
    END IF;

    -- Código TUSS: 40302237 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302237' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 11.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 11.0, 11.0);
        END IF;
    END IF;

    -- Código TUSS: 40302237 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302237' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 21.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 21.0, 21.0);
        END IF;
    END IF;

    -- Código TUSS: 28150279 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '28150279' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 44.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 44.0, 44.0);
        END IF;
    END IF;

    -- Código TUSS: 28150279 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '28150279' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 49.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 49.0, 49.0);
        END IF;
    END IF;

    -- Código TUSS: 28150279 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '28150279' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 54.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 54.0, 54.0);
        END IF;
    END IF;

    -- Código TUSS: 50000264 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000264' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 64.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 64.0, 64.0);
        END IF;
    END IF;

    -- Código TUSS: 50000264 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000264' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 69.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 69.0, 69.0);
        END IF;
    END IF;

    -- Código TUSS: 50000264 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000264' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 74.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 74.0, 74.0);
        END IF;
    END IF;

    -- Código TUSS: 50000265 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000265' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 64.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 64.0, 64.0);
        END IF;
    END IF;

    -- Código TUSS: 50000265 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000265' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 69.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 69.0, 69.0);
        END IF;
    END IF;

    -- Código TUSS: 50000265 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000265' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 74.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 74.0, 74.0);
        END IF;
    END IF;

    -- Código TUSS: 40316378 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316378' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 58.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 58.0, 58.0);
        END IF;
    END IF;

    -- Código TUSS: 40316378 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316378' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 63.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 63.0, 63.0);
        END IF;
    END IF;

    -- Código TUSS: 40316378 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316378' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 68.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 68.0, 68.0);
        END IF;
    END IF;

    -- Código TUSS: 50000266 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000266' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 120.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 120.0, 120.0);
        END IF;
    END IF;

    -- Código TUSS: 50000266 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000266' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 125.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 125.0, 125.0);
        END IF;
    END IF;

    -- Código TUSS: 50000266 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000266' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 130.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 130.0, 130.0);
        END IF;
    END IF;

    -- Código TUSS: 28150163 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '28150163' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 50.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 50.0, 50.0);
        END IF;
    END IF;

    -- Código TUSS: 28150163 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '28150163' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 55.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 55.0, 55.0);
        END IF;
    END IF;

    -- Código TUSS: 28150163 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '28150163' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 60.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 60.0, 60.0);
        END IF;
    END IF;

    -- Código TUSS: 40313204 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313204' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 44.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 44.0, 44.0);
        END IF;
    END IF;

    -- Código TUSS: 40313204 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313204' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 49.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 49.0, 49.0);
        END IF;
    END IF;

    -- Código TUSS: 40313204 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313204' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 54.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 54.0, 54.0);
        END IF;
    END IF;

    -- Código TUSS: 40313344 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313344' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 38.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 38.0, 38.0);
        END IF;
    END IF;

    -- Código TUSS: 40313344 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313344' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 43.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 43.0, 43.0);
        END IF;
    END IF;

    -- Código TUSS: 40313344 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313344' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 48.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 48.0, 48.0);
        END IF;
    END IF;

    -- Código TUSS: 41301226 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '41301226' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 8.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 8.0, 8.0);
        END IF;
    END IF;

    -- Código TUSS: 41301226 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '41301226' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 13.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 13.0, 13.0);
        END IF;
    END IF;

    -- Código TUSS: 41301226 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '41301226' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 18.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 18.0, 18.0);
        END IF;
    END IF;

    -- Código TUSS: 40311171 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40311171' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 32.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 32.0, 32.0);
        END IF;
    END IF;

    -- Código TUSS: 40311171 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40311171' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 37.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 37.0, 37.0);
        END IF;
    END IF;

    -- Código TUSS: 40311171 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40311171' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 42.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 42.0, 42.0);
        END IF;
    END IF;

    -- Código TUSS: 40308340 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40308340' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 60.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 60.0, 60.0);
        END IF;
    END IF;

    -- Código TUSS: 40308340 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40308340' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 65.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 65.0, 65.0);
        END IF;
    END IF;

    -- Código TUSS: 40308340 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40308340' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 70.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 70.0, 70.0);
        END IF;
    END IF;

    -- Código TUSS: 40307573 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307573' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 60.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 60.0, 60.0);
        END IF;
    END IF;

    -- Código TUSS: 40307573 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307573' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 65.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 65.0, 65.0);
        END IF;
    END IF;

    -- Código TUSS: 40307573 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307573' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 70.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 70.0, 70.0);
        END IF;
    END IF;

    -- Código TUSS: 40307581 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307581' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 60.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 60.0, 60.0);
        END IF;
    END IF;

    -- Código TUSS: 40307581 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307581' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 65.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 65.0, 65.0);
        END IF;
    END IF;

    -- Código TUSS: 40307581 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307581' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 70.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 70.0, 70.0);
        END IF;
    END IF;

    -- Código TUSS: 40307565 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307565' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 60.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 60.0, 60.0);
        END IF;
    END IF;

    -- Código TUSS: 40307565 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307565' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 65.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 65.0, 65.0);
        END IF;
    END IF;

    -- Código TUSS: 40307565 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307565' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 70.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 70.0, 70.0);
        END IF;
    END IF;

    -- Código TUSS: 40302660 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302660' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 16.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 16.0, 16.0);
        END IF;
    END IF;

    -- Código TUSS: 40302660 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302660' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 21.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 21.0, 21.0);
        END IF;
    END IF;

    -- Código TUSS: 40302660 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302660' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 26.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 26.0, 26.0);
        END IF;
    END IF;

    -- Código TUSS: 28150198 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '28150198' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 44.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 44.0, 44.0);
        END IF;
    END IF;

    -- Código TUSS: 28150198 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '28150198' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 49.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 49.0, 49.0);
        END IF;
    END IF;

    -- Código TUSS: 28150198 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '28150198' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 54.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 54.0, 54.0);
        END IF;
    END IF;

    -- Código TUSS: 40303110 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40303110' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 9.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 9.5, 9.5);
        END IF;
    END IF;

    -- Código TUSS: 40303110 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40303110' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 9.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 9.5, 9.5);
        END IF;
    END IF;

    -- Código TUSS: 40303110 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40303110' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 14.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 14.5, 14.5);
        END IF;
    END IF;

    -- Código TUSS: 40303110 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40303110' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 14.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 14.5, 14.5);
        END IF;
    END IF;

    -- Código TUSS: 40303110 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40303110' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 12.4
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 12.4, 12.4);
        END IF;
    END IF;

    -- Código TUSS: 40303110 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40303110' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 12.4
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 12.4, 12.4);
        END IF;
    END IF;

    -- Código TUSS: 40303110 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40303110' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 19.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 19.5, 19.5);
        END IF;
    END IF;

    -- Código TUSS: 40303110 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40303110' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 19.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 19.5, 19.5);
        END IF;
    END IF;

    -- Código TUSS: 40305465 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40305465' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 48.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 48.0, 48.0);
        END IF;
    END IF;

    -- Código TUSS: 40305465 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40305465' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 53.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 53.0, 53.0);
        END IF;
    END IF;

    -- Código TUSS: 40305465 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40305465' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 58.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 58.0, 58.0);
        END IF;
    END IF;

    -- Código TUSS: 50000251 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000251' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 24.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 24.0, 24.0);
        END IF;
    END IF;

    -- Código TUSS: 50000251 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000251' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 29.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 29.0, 29.0);
        END IF;
    END IF;

    -- Código TUSS: 50000251 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000251' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 34.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 34.0, 34.0);
        END IF;
    END IF;

    -- Código TUSS: 40310221 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310221' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 52.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 52.0, 52.0);
        END IF;
    END IF;

    -- Código TUSS: 40310221 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310221' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 57.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 57.0, 57.0);
        END IF;
    END IF;

    -- Código TUSS: 40310221 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310221' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 62.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 62.0, 62.0);
        END IF;
    END IF;

    -- Código TUSS: 50000260 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000260' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 8.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 8.0, 8.0);
        END IF;
    END IF;

    -- Código TUSS: 50000260 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000260' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 13.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 13.0, 13.0);
        END IF;
    END IF;

    -- Código TUSS: 50000260 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000260' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 18.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 18.0, 18.0);
        END IF;
    END IF;

    -- Código TUSS: 40304450 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304450' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 8.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 8.0, 8.0);
        END IF;
    END IF;

    -- Código TUSS: 40304450 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304450' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 13.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 13.0, 13.0);
        END IF;
    END IF;

    -- Código TUSS: 40304450 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304450' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 72.59
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 72.59, 72.59);
        END IF;
    END IF;

    -- Código TUSS: 40304450 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304450' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 18.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 18.0, 18.0);
        END IF;
    END IF;

    -- Código TUSS: 40304477 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304477' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 26.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 26.0, 26.0);
        END IF;
    END IF;

    -- Código TUSS: 40304477 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304477' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 31.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 31.0, 31.0);
        END IF;
    END IF;

    -- Código TUSS: 40304477 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304477' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 36.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 36.0, 36.0);
        END IF;
    END IF;

    -- Código TUSS: 40302318 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302318' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 9.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 9.5, 9.5);
        END IF;
    END IF;

    -- Código TUSS: 40302318 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302318' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 14.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 14.5, 14.5);
        END IF;
    END IF;

    -- Código TUSS: 40302318 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302318' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 10.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 10.0, 10.0);
        END IF;
    END IF;

    -- Código TUSS: 40302318 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302318' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 19.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 19.5, 19.5);
        END IF;
    END IF;

    -- Código TUSS: 40316408 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316408' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 35.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 35.0, 35.0);
        END IF;
    END IF;

    -- Código TUSS: 40316408 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316408' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 40.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 40.0, 40.0);
        END IF;
    END IF;

    -- Código TUSS: 40316408 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316408' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 45.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 45.0, 45.0);
        END IF;
    END IF;

    -- Código TUSS: 40316416 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316416' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 34.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 34.0, 34.0);
        END IF;
    END IF;

    -- Código TUSS: 40316416 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316416' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 39.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 39.0, 39.0);
        END IF;
    END IF;

    -- Código TUSS: 40316416 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316416' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 35.98
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 35.98, 35.98);
        END IF;
    END IF;

    -- Código TUSS: 40316416 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316416' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 44.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 44.0, 44.0);
        END IF;
    END IF;

    -- Código TUSS: 40302385 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302385' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 16.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 16.0, 16.0);
        END IF;
    END IF;

    -- Código TUSS: 40302385 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302385' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 21.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 21.0, 21.0);
        END IF;
    END IF;

    -- Código TUSS: 40302385 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302385' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 26.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 26.0, 26.0);
        END IF;
    END IF;

    -- Código TUSS: 50000253 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000253' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 16.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 16.0, 16.0);
        END IF;
    END IF;

    -- Código TUSS: 50000253 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000253' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 21.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 21.0, 21.0);
        END IF;
    END IF;

    -- Código TUSS: 50000253 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000253' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 26.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 26.0, 26.0);
        END IF;
    END IF;

    -- Código TUSS: 40308391 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40308391' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 26.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 26.0, 26.0);
        END IF;
    END IF;

    -- Código TUSS: 40308391 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40308391' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 31.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 31.0, 31.0);
        END IF;
    END IF;

    -- Código TUSS: 40308391 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40308391' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 36.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 36.0, 36.0);
        END IF;
    END IF;

    -- Código TUSS: 40316130 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316130' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 38.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 38.0, 38.0);
        END IF;
    END IF;

    -- Código TUSS: 40316130 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316130' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 43.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 43.0, 43.0);
        END IF;
    END IF;

    -- Código TUSS: 40316130 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316130' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 48.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 48.0, 48.0);
        END IF;
    END IF;

    -- Código TUSS: 40316149 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316149' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 26.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 26.0, 26.0);
        END IF;
    END IF;

    -- Código TUSS: 40316149 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316149' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 31.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 31.0, 31.0);
        END IF;
    END IF;

    -- Código TUSS: 40316149 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316149' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 36.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 36.0, 36.0);
        END IF;
    END IF;

    -- Código TUSS: 40304558 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304558' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 11.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 11.0, 11.0);
        END IF;
    END IF;

    -- Código TUSS: 40304558 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304558' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 16.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 16.0, 16.0);
        END IF;
    END IF;

    -- Código TUSS: 40304558 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304558' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 21.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 21.0, 21.0);
        END IF;
    END IF;

    -- Código TUSS: 40310337 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310337' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 64.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 64.0, 64.0);
        END IF;
    END IF;

    -- Código TUSS: 40310337 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310337' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 69.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 69.0, 69.0);
        END IF;
    END IF;

    -- Código TUSS: 40310337 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40310337' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 74.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 74.0, 74.0);
        END IF;
    END IF;

    -- Código TUSS: 40307697 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307697' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 32.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 32.0, 32.0);
        END IF;
    END IF;

    -- Código TUSS: 40307697 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307697' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 37.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 37.0, 37.0);
        END IF;
    END IF;

    -- Código TUSS: 40307697 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307697' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 46.68
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 46.68, 46.68);
        END IF;
    END IF;

    -- Código TUSS: 40307697 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307697' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 42.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 42.0, 42.0);
        END IF;
    END IF;

    -- Código TUSS: 40307700 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307700' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 36.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 36.0, 36.0);
        END IF;
    END IF;

    -- Código TUSS: 40307700 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307700' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 41.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 41.0, 41.0);
        END IF;
    END IF;

    -- Código TUSS: 40307700 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307700' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 40.7
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 40.7, 40.7);
        END IF;
    END IF;

    -- Código TUSS: 40307700 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307700' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 46.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 46.0, 46.0);
        END IF;
    END IF;

    -- Código TUSS: 40303136 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40303136' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 9.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 9.0, 9.0);
        END IF;
    END IF;

    -- Código TUSS: 40303136 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40303136' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 14.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 14.0, 14.0);
        END IF;
    END IF;

    -- Código TUSS: 40303136 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40303136' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 12.4
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 12.4, 12.4);
        END IF;
    END IF;

    -- Código TUSS: 40303136 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40303136' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 19.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 19.0, 19.0);
        END IF;
    END IF;

    -- Código TUSS: 40316459 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316459' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 50.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 50.0, 50.0);
        END IF;
    END IF;

    -- Código TUSS: 40316459 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316459' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 55.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 55.0, 55.0);
        END IF;
    END IF;

    -- Código TUSS: 40316459 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316459' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 60.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 60.0, 60.0);
        END IF;
    END IF;

    -- Código TUSS: 40316300 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316300' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 64.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 64.0, 64.0);
        END IF;
    END IF;

    -- Código TUSS: 40316300 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316300' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 69.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 69.0, 69.0);
        END IF;
    END IF;

    -- Código TUSS: 40316300 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316300' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 74.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 74.0, 74.0);
        END IF;
    END IF;

    -- Código TUSS: 40302423 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302423' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 9.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 9.5, 9.5);
        END IF;
    END IF;

    -- Código TUSS: 40302423 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302423' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 14.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 14.5, 14.5);
        END IF;
    END IF;

    -- Código TUSS: 40302423 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302423' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 10.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 10.0, 10.0);
        END IF;
    END IF;

    -- Código TUSS: 40302423 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302423' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 19.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 19.5, 19.5);
        END IF;
    END IF;

    -- Código TUSS: 40316440 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316440' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 64.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 64.0, 64.0);
        END IF;
    END IF;

    -- Código TUSS: 40316440 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316440' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 69.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 69.0, 69.0);
        END IF;
    END IF;

    -- Código TUSS: 40316440 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316440' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 74.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 74.0, 74.0);
        END IF;
    END IF;

    -- Código TUSS: 40303020 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40303020' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 8.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 8.0, 8.0);
        END IF;
    END IF;

    -- Código TUSS: 40303020 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40303020' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 13.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 13.0, 13.0);
        END IF;
    END IF;

    -- Código TUSS: 40303020 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40303020' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 18.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 18.0, 18.0);
        END IF;
    END IF;

    -- Código TUSS: 40312380 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40312380' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 52.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 52.0, 52.0);
        END IF;
    END IF;

    -- Código TUSS: 40312380 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40312380' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 57.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 57.0, 57.0);
        END IF;
    END IF;

    -- Código TUSS: 40312380 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40312380' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 62.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 62.0, 62.0);
        END IF;
    END IF;

    -- Código TUSS: 40316556 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316556' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 30.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 30.0, 30.0);
        END IF;
    END IF;

    -- Código TUSS: 40316556 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316556' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 35.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 35.0, 35.0);
        END IF;
    END IF;

    -- Código TUSS: 40316556 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316556' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 40.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 40.0, 40.0);
        END IF;
    END IF;

    -- Código TUSS: 40316467 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316467' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 44.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 44.0, 44.0);
        END IF;
    END IF;

    -- Código TUSS: 40316467 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316467' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 49.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 49.0, 49.0);
        END IF;
    END IF;

    -- Código TUSS: 40316467 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316467' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 44.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 44.0, 44.0);
        END IF;
    END IF;

    -- Código TUSS: 40316467 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316467' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 54.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 54.0, 54.0);
        END IF;
    END IF;

    -- Código TUSS: 40316483 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316483' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 84.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 84.0, 84.0);
        END IF;
    END IF;

    -- Código TUSS: 40316483 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316483' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 89.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 89.0, 89.0);
        END IF;
    END IF;

    -- Código TUSS: 40316483 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316483' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 90.46
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 90.46, 90.46);
        END IF;
    END IF;

    -- Código TUSS: 40316483 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316483' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 94.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 94.0, 94.0);
        END IF;
    END IF;

    -- Código TUSS: 40316491 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316491' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 36.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 36.0, 36.0);
        END IF;
    END IF;

    -- Código TUSS: 40316491 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316491' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 41.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 41.0, 41.0);
        END IF;
    END IF;

    -- Código TUSS: 40316491 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316491' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 36.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 36.0, 36.0);
        END IF;
    END IF;

    -- Código TUSS: 40316491 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316491' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 46.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 46.0, 46.0);
        END IF;
    END IF;

    -- Código TUSS: 40316548 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316548' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 36.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 36.0, 36.0);
        END IF;
    END IF;

    -- Código TUSS: 40316548 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316548' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 41.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 41.0, 41.0);
        END IF;
    END IF;

    -- Código TUSS: 40316548 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316548' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 36.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 36.0, 36.0);
        END IF;
    END IF;

    -- Código TUSS: 40316548 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316548' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 46.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 46.0, 46.0);
        END IF;
    END IF;

    -- Código TUSS: 40304590 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304590' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 18.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 18.0, 18.0);
        END IF;
    END IF;

    -- Código TUSS: 40304590 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304590' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 23.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 23.0, 23.0);
        END IF;
    END IF;

    -- Código TUSS: 40304590 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304590' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 28.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 28.0, 28.0);
        END IF;
    END IF;

    -- Código TUSS: 40316505 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316505' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 40.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 40.0, 40.0);
        END IF;
    END IF;

    -- Código TUSS: 40316505 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316505' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 45.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 45.0, 45.0);
        END IF;
    END IF;

    -- Código TUSS: 40316505 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316505' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 52.68
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 52.68, 52.68);
        END IF;
    END IF;

    -- Código TUSS: 40316505 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316505' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 50.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 50.0, 50.0);
        END IF;
    END IF;

    -- Código TUSS: 40316513 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316513' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 40.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 40.0, 40.0);
        END IF;
    END IF;

    -- Código TUSS: 40316513 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316513' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 45.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 45.0, 45.0);
        END IF;
    END IF;

    -- Código TUSS: 40316513 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316513' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 40.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 40.0, 40.0);
        END IF;
    END IF;

    -- Código TUSS: 40316513 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316513' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 50.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 50.0, 50.0);
        END IF;
    END IF;

    -- Código TUSS: 40302504 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302504' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 9.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 9.5, 9.5);
        END IF;
    END IF;

    -- Código TUSS: 40302504 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302504' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 14.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 14.5, 14.5);
        END IF;
    END IF;

    -- Código TUSS: 40302504 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302504' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 10.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 10.0, 10.0);
        END IF;
    END IF;

    -- Código TUSS: 40302504 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302504' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 19.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 19.5, 19.5);
        END IF;
    END IF;

    -- Código TUSS: 40302512 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302512' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 9.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 9.5, 9.5);
        END IF;
    END IF;

    -- Código TUSS: 40302512 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302512' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 14.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 14.5, 14.5);
        END IF;
    END IF;

    -- Código TUSS: 40302512 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302512' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 10.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 10.0, 10.0);
        END IF;
    END IF;

    -- Código TUSS: 40302512 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302512' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 19.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 19.5, 19.5);
        END IF;
    END IF;

    -- Código TUSS: 40316530 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316530' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 40.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 40.0, 40.0);
        END IF;
    END IF;

    -- Código TUSS: 40316530 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316530' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 45.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 45.0, 45.0);
        END IF;
    END IF;

    -- Código TUSS: 40316530 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316530' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 40.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 40.0, 40.0);
        END IF;
    END IF;

    -- Código TUSS: 40316530 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316530' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 50.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 50.0, 50.0);
        END IF;
    END IF;

    -- Código TUSS: 50000172 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000172' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 150.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 150.0, 150.0);
        END IF;
    END IF;

    -- Código TUSS: 50000172 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000172' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 150.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 150.0, 150.0);
        END IF;
    END IF;

    -- Código TUSS: 50000172 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000172' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 150.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 150.0, 150.0);
        END IF;
    END IF;

    -- Código TUSS: 50000267 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000267' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 150.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 150.0, 150.0);
        END IF;
    END IF;

    -- Código TUSS: 50000267 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000267' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 150.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 150.0, 150.0);
        END IF;
    END IF;

    -- Código TUSS: 50000267 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000267' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 150.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 150.0, 150.0);
        END IF;
    END IF;

    -- Código TUSS: 40307794 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307794' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 70.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 70.0, 70.0);
        END IF;
    END IF;

    -- Código TUSS: 40307794 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307794' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 75.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 75.0, 75.0);
        END IF;
    END IF;

    -- Código TUSS: 40307794 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307794' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 80.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 80.0, 80.0);
        END IF;
    END IF;

    -- Código TUSS: 40307808 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307808' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 70.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 70.0, 70.0);
        END IF;
    END IF;

    -- Código TUSS: 40307808 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307808' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 75.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 75.0, 75.0);
        END IF;
    END IF;

    -- Código TUSS: 40307808 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307808' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 80.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 80.0, 80.0);
        END IF;
    END IF;

    -- Código TUSS: 40307824 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307824' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 24.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 24.0, 24.0);
        END IF;
    END IF;

    -- Código TUSS: 40307824 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307824' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 29.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 29.0, 29.0);
        END IF;
    END IF;

    -- Código TUSS: 40307824 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307824' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 49.56
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 49.56, 49.56);
        END IF;
    END IF;

    -- Código TUSS: 40307824 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307824' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 34.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 34.0, 34.0);
        END IF;
    END IF;

    -- Código TUSS: 40307832 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307832' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 30.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 30.0, 30.0);
        END IF;
    END IF;

    -- Código TUSS: 40307832 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307832' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 35.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 35.0, 35.0);
        END IF;
    END IF;

    -- Código TUSS: 40307832 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307832' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 61.05
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 61.05, 61.05);
        END IF;
    END IF;

    -- Código TUSS: 40307832 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307832' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 40.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 40.0, 40.0);
        END IF;
    END IF;

    -- Código TUSS: 40302520 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302520' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 28.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 28.0, 28.0);
        END IF;
    END IF;

    -- Código TUSS: 40302520 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302520' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 33.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 33.0, 33.0);
        END IF;
    END IF;

    -- Código TUSS: 40302520 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302520' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 28.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 28.0, 28.0);
        END IF;
    END IF;

    -- Código TUSS: 40302520 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302520' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 38.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 38.0, 38.0);
        END IF;
    END IF;

    -- Código TUSS: 50000268 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000268' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 80.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 80.0, 80.0);
        END IF;
    END IF;

    -- Código TUSS: 50000268 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000268' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 85.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 85.0, 85.0);
        END IF;
    END IF;

    -- Código TUSS: 50000268 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '50000268' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 90.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 90.0, 90.0);
        END IF;
    END IF;

    -- Código TUSS: 40302547 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302547' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 9.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 9.5, 9.5);
        END IF;
    END IF;

    -- Código TUSS: 40302547 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302547' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 14.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 14.5, 14.5);
        END IF;
    END IF;

    -- Código TUSS: 40302547 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302547' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 10.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 10.0, 10.0);
        END IF;
    END IF;

    -- Código TUSS: 40302547 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302547' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 19.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 19.5, 19.5);
        END IF;
    END IF;

    -- Código TUSS: 40316521 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316521' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 30.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 30.0, 30.0);
        END IF;
    END IF;

    -- Código TUSS: 40316521 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316521' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 35.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 35.0, 35.0);
        END IF;
    END IF;

    -- Código TUSS: 40316521 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316521' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 30.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 30.0, 30.0);
        END IF;
    END IF;

    -- Código TUSS: 40316521 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316521' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 40.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 40.0, 40.0);
        END IF;
    END IF;

    -- Código TUSS: 40302580 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302580' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 9.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 9.5, 9.5);
        END IF;
    END IF;

    -- Código TUSS: 40302580 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302580' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 14.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 14.5, 14.5);
        END IF;
    END IF;

    -- Código TUSS: 40302580 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302580' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 10.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 10.0, 10.0);
        END IF;
    END IF;

    -- Código TUSS: 40302580 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302580' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 19.5
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 19.5, 19.5);
        END IF;
    END IF;

    -- Código TUSS: 40307760 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307760' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 12.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 12.0, 12.0);
        END IF;
    END IF;

    -- Código TUSS: 40307760 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307760' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 17.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 17.0, 17.0);
        END IF;
    END IF;

    -- Código TUSS: 40307760 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307760' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 12.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 12.0, 12.0);
        END IF;
    END IF;

    -- Código TUSS: 40307760 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307760' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 22.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 22.0, 22.0);
        END IF;
    END IF;

    -- Código TUSS: 40304370 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304370' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 15.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 15.0, 15.0);
        END IF;
    END IF;

    -- Código TUSS: 40304370 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304370' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 20.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 20.0, 20.0);
        END IF;
    END IF;

    -- Código TUSS: 40304370 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304370' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 15.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 15.0, 15.0);
        END IF;
    END IF;

    -- Código TUSS: 40304370 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304370' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 25.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 25.0, 25.0);
        END IF;
    END IF;

    -- Código TUSS: 40302601 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302601' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 90.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 90.0, 90.0);
        END IF;
    END IF;

    -- Código TUSS: 40302601 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302601' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 95.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 95.0, 95.0);
        END IF;
    END IF;

    -- Código TUSS: 40302601 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302601' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 100.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 100.0, 100.0);
        END IF;
    END IF;

    -- Código TUSS: 40316572 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316572' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 34.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 34.0, 34.0);
        END IF;
    END IF;

    -- Código TUSS: 40316572 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316572' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 39.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 39.0, 39.0);
        END IF;
    END IF;

    -- Código TUSS: 40316572 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316572' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 34.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 34.0, 34.0);
        END IF;
    END IF;

    -- Código TUSS: 40316572 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40316572' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 44.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 44.0, 44.0);
        END IF;
    END IF;

    -- Código TUSS: 40302830 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302830' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 60.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 60.0, 60.0);
        END IF;
    END IF;

    -- Código TUSS: 40302830 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302830' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 65.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 65.0, 65.0);
        END IF;
    END IF;

    -- Código TUSS: 40302830 | Convênio: CLINIPAM
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302830' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%CLINIPAM%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 60.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 60.0, 60.0);
        END IF;
    END IF;

    -- Código TUSS: 40302830 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40302830' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 70.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 70.0, 70.0);
        END IF;
    END IF;

    -- Código TUSS: 40307867 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307867' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 9.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 9.0, 9.0);
        END IF;
    END IF;

    -- Código TUSS: 40307867 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307867' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 14.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 14.0, 14.0);
        END IF;
    END IF;

    -- Código TUSS: 40307867 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40307867' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 19.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 19.0, 19.0);
        END IF;
    END IF;

    -- Código TUSS: 40313328 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313328' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 36.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 36.0, 36.0);
        END IF;
    END IF;

    -- Código TUSS: 40313328 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313328' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 41.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 41.0, 41.0);
        END IF;
    END IF;

    -- Código TUSS: 40313328 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40313328' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 46.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 46.0, 46.0);
        END IF;
    END IF;

    -- Código TUSS: 40304523 | Convênio: VALE +/MENSALISTA
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304523' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%VALE +/MENSALISTA%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 56.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 56.0, 56.0);
        END IF;
    END IF;

    -- Código TUSS: 40304523 | Convênio: PARCEIRO/SUS
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304523' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARCEIRO/SUS%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 61.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 61.0, 61.0);
        END IF;
    END IF;

    -- Código TUSS: 40304523 | Convênio: PARTICULAR
    SELECT id INTO v_procedimento_id FROM procedimento WHERE codigo = '40304523' LIMIT 1;
    SELECT id INTO v_convenio_id FROM convenio WHERE nome ILIKE '%PARTICULAR%' LIMIT 1;

    IF v_procedimento_id IS NOT NULL AND v_convenio_id IS NOT NULL THEN
        -- Verificar se já existe registro
        IF EXISTS (
            SELECT 1 FROM preco_procedimento
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id
        ) THEN
            -- UPDATE
            UPDATE preco_procedimento
            SET repasse = 66.0
            WHERE procedimento_id = v_procedimento_id
              AND convenio_id = v_convenio_id
              AND unidade_id = v_unidade_id;
        ELSE
            -- INSERT
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, 66.0, 66.0);
        END IF;
    END IF;

END $$;