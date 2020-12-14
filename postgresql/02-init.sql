CREATE EXTENSION pg_cron;

CREATE TABLE IF NOT EXISTS public.data (
    n INT NOT NULL,
    created_at TIMESTAMP DEFAULT LOCALTIMESTAMP
);

CREATE INDEX ON public.data (created_at);

SELECT cron.schedule('10 * * * *', $$
    DELETE
        FROM public.data
        WHERE created_at < now() - interval '30 minute'
$$);
