import React, {useCallback} from 'react';

const NEXT_PUBLIC_API_ENDPOINT = process.env.NEXT_PUBLIC_API_ENDPOINT

const PublicEnv = () => {
    
    const dispatcherFetch = useCallback(() => {
        fetch(NEXT_PUBLIC_API_ENDPOINT + '/test')
        .then(response => response.text())
        .then(data => console.log(data));
    },[])
    
    return <div>
        <div>NEXT_PUBLIC_DISPATCHER_ENDPOINT : {NEXT_PUBLIC_API_ENDPOINT}
            <input onClick={dispatcherFetch} type="button" value="fetch"/>
        </div>
    </div>
}

export default PublicEnv