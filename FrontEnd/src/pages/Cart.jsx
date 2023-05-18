import React from 'react';
import { Typography, Grid, Paper, Button } from '@mui/material';
import { styled } from '@mui/material/styles';
import { useNavigate } from 'react-router-dom';

const CartItem = styled(Paper)(({ theme }) => ({
    padding: theme.spacing(2),
    marginBottom: theme.spacing(2),
}));

export function Cart() {
    const navigate = useNavigate();
    const cartItems = [
        { id: 1, name: 'Product 1', price: 10, quantity: 2 },
        { id: 2, name: 'Product 2', price: 20, quantity: 1 },
        { id: 3, name: 'Product 3', price: 15, quantity: 3 },
    ];

    const handleRemoveItem = (itemId) => {
        // TODO: Implement remove item logic
    };

    return (
        <React.Fragment>
            <Grid container spacing={2}>
                <Grid item xs={12}>
                    <Typography variant="h4" align="center" gutterBottom>
                        Shopping Cart
                    </Typography>
                </Grid>
                <Grid item xs={12}>
                    {cartItems.map((item) => (
                        <CartItem key={item.id}>
                            <Grid container spacing={2} alignItems="center">
                                <Grid item xs={4}>
                                    <Typography variant="h6">{item.name}</Typography>
                                </Grid>
                                <Grid item xs={2}>
                                    <Typography variant="body1">${item.price}</Typography>
                                </Grid>
                                <Grid item xs={3}>
                                    <Typography variant="body1">Quantity: {item.quantity}</Typography>
                                </Grid>
                                <Grid item xs={2}>
                                    <Button variant="outlined" color="error" onClick={() => handleRemoveItem(item.id)}>
                                        Remove
                                    </Button>
                                </Grid>
                            </Grid>
                        </CartItem>
                    ))}
                </Grid>
                <Grid item xs={12}>
                    <Typography variant="h6" align="right">
                        Total: $100
                    </Typography>
                </Grid>
            </Grid>
            <Grid container textAlign="center" >
                <Grid item xs={6}>
                    <Button variant="contained" color="primary">
                        Checkout
                    </Button>
                </Grid>
                <Grid item xs={6}>
                    <Button variant="contained" color="primary" onClick={() => navigate("/")}>
                        Keep shopping
                    </Button>
                </Grid>
            </Grid>
        </React.Fragment>
    );
};











