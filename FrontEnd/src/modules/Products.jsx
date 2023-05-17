import { Button } from '@mui/material';
import axios from 'axios'
import React, { useEffect, useState } from 'react'

export default function Products() {
    const [productData, setProductData] = useState();

    // useEffect(() => {
    //     axios.get("http://127.0.0.1:8000/product/")
    //         .then((resp) => {
    //             console.log(resp.data)
    //             //setProductData(resp.data)
    //         })
    //         .catch((err) => console.log("Khong thanh cong", err.message))
    // }, [])

    const handleChecks = () => {
        axios.get("http://127.0.0.1:8000/product/")
            .then((resp) => {
                console.log(resp.result)
                //setProductData(resp.data)
            })
            .catch((err) => console.log("Khong thanh cong", err.message))
    }


    return (
        <div>
            <Button onClick={handleChecks}>Click me</Button>
            {/* {productData.map(item => (
                <div key={item.id}>
                    <img src={item.get_image} alt={item.name} />
                    <h2>{item.description}</h2>
                    <p>{item.price}</p>
                </div>
            ))} */}
        </div>
    )
}

