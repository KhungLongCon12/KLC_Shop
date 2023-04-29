import React from "react";
import { AppBar, Avatar, Badge, Box, Button, Card, Toolbar, Typography } from "@mui/material";
import { ThemeProvider, createTheme } from '@mui/material/styles';
import { Stack } from "@mui/system";
import logo from '../assets/img/dyno-store.png'
import ShoppingCartTwoToneIcon from '@mui/icons-material/ShoppingCartTwoTone';
import HowToRegTwoToneIcon from '@mui/icons-material/HowToRegTwoTone';
import AccountCircleTwoToneIcon from '@mui/icons-material/AccountCircleTwoTone';
import { useNavigate } from "react-router-dom";

export default function Navbar() {

    const customTheme = createTheme({
        palette: {
            primary: {
                main: '#DC678E',
            }
        },
    })

    // const styledBaged = () => {
    //     setBadgeNum(badgeNum + 1);
    // }

    const navigate = useNavigate();

    return (
        <React.Fragment>
            <Card>
                <Box sx={{ flexGrow: 1 }} >
                    <ThemeProvider theme={customTheme}>
                        <AppBar position="static" color="primary">
                            <Toolbar>
                                <Avatar src={logo} alt='dyno-logo' sx={{ width: 60, height: 60, margin: 1 }} onDoubleClick={() => { navigate('/') }} />
                                <Typography variant="h3" sx={{ paddingLeft: 1, fontFamily: 'cursive', color: '#80cc28' }}>
                                    Dyno Store Welcome !
                                </Typography>
                                <Stack flexGrow={1} spacing={1} direction='row' justifyContent="flex-end">
                                    <Button color="inherit" size="large"
                                        onClick={() => { navigate('/login') }}
                                        endIcon={<AccountCircleTwoToneIcon />}>
                                        Login
                                    </Button>
                                    <Button color="inherit" size="large"
                                        onClick={() => { navigate('/signup') }}
                                        endIcon={<HowToRegTwoToneIcon />}>Sign Up</Button>
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