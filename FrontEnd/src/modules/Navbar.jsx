import React, { useState } from "react";
import { AppBar, Avatar, Badge, Box, Button, Card, Toolbar, Typography } from "@mui/material";
import { ThemeProvider, createTheme } from '@mui/material/styles';
import { Stack } from "@mui/system";
import logo from '../assets/img/dynoStoreLogo2.png'
import ShoppingCartTwoToneIcon from '@mui/icons-material/ShoppingCartTwoTone';
import HowToRegTwoToneIcon from '@mui/icons-material/HowToRegTwoTone';
import AccountCircleTwoToneIcon from '@mui/icons-material/AccountCircleTwoTone';
import { useNavigate } from "react-router-dom";

export default function Navbar({ loggedInUser, onLogout }) {
    const customTheme = createTheme({
        palette: {
            primary: {
                main: '#011c37',
            }
        },
    })

    const navigate = useNavigate();

    return (
        <React.Fragment>
            <Card>
                <Box sx={{ flexGrow: 1 }} >
                    <ThemeProvider theme={customTheme}>
                        <AppBar position="static" color="primary">
                            <Toolbar>
                                <Avatar src={logo} alt='dyno-logo' onClick={() => { navigate('/login') }}
                                    sx={{
                                        '& .MuiAvatar-img': {
                                            width: "200%",
                                            height: "200%",
                                            textAlign: "center",
                                            objectFit: "cover",
                                            color: "transparent",
                                            textIndent: "10000px",
                                        },
                                        width: "80px",
                                        height: "60px",
                                        margin: 1,
                                        border: "none"
                                    }}
                                    onDoubleClick={() => { navigate('/') }} />
                                <Typography variant="h3" sx={{ paddingLeft: 1, fontFamily: 'cursive', color: '#a48c52' }}>
                                    Dyno Store Welcome !
                                </Typography>
                                <Stack flexGrow={1} spacing={1} direction='row' justifyContent="flex-end">
                                    {loggedInUser ? (
                                        <>
                                            <Typography variant="h6" sx={{ paddingRight: 1 }}>
                                                Hello, {loggedInUser}
                                            </Typography>
                                            <Button color="inherit" size="large" onClick={onLogout}>
                                                Logout
                                            </Button>
                                        </>
                                    ) : (
                                        <>
                                            <Button color="inherit" size="large"
                                                onClick={() => { navigate('/login') }}
                                                endIcon={<AccountCircleTwoToneIcon />}>
                                                Login
                                            </Button>
                                            <Button color="inherit" size="large"
                                                onClick={() => { navigate('/signup') }}
                                                endIcon={<HowToRegTwoToneIcon />}>Sign Up</Button>
                                        </>
                                    )}
                                    <Button color="inherit" size="large" onClick={() => { navigate('/cart') }} endIcon={
                                        <Badge color="secondary">
                                            <ShoppingCartTwoToneIcon />
                                        </Badge>}>
                                        Cart
                                    </Button>
                                </Stack>
                            </Toolbar>
                        </AppBar>
                    </ThemeProvider>
                </Box >
            </Card>
        </React.Fragment>
    );
}