import React from 'react';

const PublicEnv = () => {
    return <div>
        <div>Extern Env : {process.env.NEXT_PUBLIC_EXTERN_ENV}</div>
        <div>Public Env : {process.env.NEXT_PUBLIC_TEST_ENV}</div>
    </div>
}

export default PublicEnv