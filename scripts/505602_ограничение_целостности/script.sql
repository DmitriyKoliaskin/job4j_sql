create table roles (
    id              INT             GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name_role       TEXT            NOT NULL UNIQUE,
    created_at      TIMESTAMPTZ     NOT NULL DEFAULT NOW()
    );

create table users (
    id              BIGINT              GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email           TEXT                NOT NULL UNIQUE,
    password_hash   TEXT                NOT NULL,
    role_id         INT                 NOT NULL REFERENCES roles (id),
    created_at      TIMESTAMPTZ         NOT NULL DEFAULT NOW()
    );

create table states (
    id              BIGINT              GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    is_active       BOOLEAN             NOT NULL DEFAULT TRUE,
    created_at      TIMESTAMPTZ         NOT NULL DEFAULT NOW()
    );

create table categories (
    id              BIGINT              GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name_categories TEXT                NOT NULL UNIQUE,
    created_at      TIMESTAMPTZ         NOT NULL DEFAULT NOW()
    );

create table items (
    id                  BIGINT              GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id             BIGINT              NOT NULL REFERENCES users (id),
    name_item           TEXT                NOT NULL UNIQUE,
    description_item    TEXT                NOT NULL,
    item_categories     BIGINT              NOT NULL REFERENCES categories (id),
    item_states         BIGINT              NOT NULL REFERENCES states (id),
    created_at          TIMESTAMPTZ         NOT NULL DEFAULT NOW()
    );

create table comments (
    id              BIGINT              GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    text_comment    TEXT                NOT NULL,
    user_id         BIGINT              NOT NULL REFERENCES users (id),
    item_id         BIGINT              NOT NULL REFERENCES items (id),
    created_at      TIMESTAMPTZ         NOT NULL DEFAULT NOW()
    );