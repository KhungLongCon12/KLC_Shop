import "../css/login.css"
import LOGINIMAGE from "../assets/img/login.svg"
import WORDGREETING from "../assets/img/word-Logo-Remove-BackGr.png"
import { Box, Button, Grid, Stack, TextField, Typography } from "@mui/material"
import { useNavigate } from "react-router-dom";
import GoogleIcon from '@mui/icons-material/Google';
import LoginIcon from '@mui/icons-material/Login';

export function Login() {
    const navigate = useNavigate();

    const logSuccess = () => {
        navigate('/')
    }

    return (
        <Grid container direction="row" justifyContent="center" alignItems='center' >
            <Grid item xs={6}>
                <img className="login-image" alt="login" src={LOGINIMAGE} />
            </Grid>
            <Grid item xs={6}>
                <Box component="form"
                    sx={{
                        '& .MuiTextField-root': { m: 1, width: '450px' },
                        '& .MuiButton-root': { m: 2 },
                        my: 6, mx: 4,
                        marginBottom: "6px",
                        display: 'flex',
                        flexDirection: 'column',
                        alignItems: 'center',
                    }}>
                    <Typography component='img' src={WORDGREETING} alt='greeting' />
                    <Typography id="header"> Log in </Typography>
                    <TextField type="text" label="Phone number / Gmail" placeholder="Phone number / Gmail" />
                    <TextField type="password" label="Password" placeholder="At least 8 character" />
                    <Typography className="input" paddingLeft="300px" component="h1"> Forgot your <a href="?"> password </a> ? </Typography>
                    <div>
                        <Stack direction="row" spacing={4} display="flex" alignItems="center">
                            <Button variant="contained" color="info" startIcon={<LoginIcon fontSize="large" />} type="submit" onClick={logSuccess} >
                                Login
                            </Button>
                            <Button variant="contained" color="warning" startIcon={<GoogleIcon fontSize="large" />} onClick={() => navigate()} >
                                Login with Google
                            </Button>
                        </Stack>
                    </div>
                    <Typography className="input" component="h1"> New to DYNO Store ? <a href="/register"> Sign up </a></Typography>
                </Box>
            </Grid>
        </Grid >
    )
}