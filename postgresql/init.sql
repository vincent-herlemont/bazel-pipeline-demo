CREATE TABLE IF NOT EXISTS public.data (
    n INT NOT NULL,
    created_at TIMESTAMP DEFAULT LOCALTIMESTAMP
);

CREATE INDEX ON public.data (created_at);