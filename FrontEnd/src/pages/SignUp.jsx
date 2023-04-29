import { useState } from "react"
import axios from "axios"
import "../css/login.css"
import SIGNUPBGR from "../assets/img/sign-up.png"
import WORDGREETING from "../assets/img/word-Logo-Remove-BackGr.png"
import { Box, Button, Grid, Stack, TextField, Typography } from "@mui/material"
import { useNavigate } from "react-router-dom"

export function SignUp() {
    const [user, setUser] = useState()
    const [pass, setPass] = useState()

    const handleSignUp = () => {
        const data = {
            username: " hung",
            password: "123456789",
            name: "zxb",
            gender: "m",
            phone: "0123456789",
            birthday: "2000-01-01",
            email: "luong@gmail.com",
            career: "st"
        };
        axios.post("http://127.0.0.1:8000/account/sign_up/", data)
            .then((resp) => {
                console.log('login thanh cong');
                console.log(resp.data);
                navigate('/login');
            }).catch((err) => {
                console.log('khong thanh cong')
                console.log("Error", err.message);
            });
    }

    const navigate = useNavigate();

    return (
        <Grid container direction="row" justifyContent="center" alignItems='center' >
            <Grid item xs={6}>
                <Box
                    sx={{
                        '& .MuiTextField-root': { m: 1, width: '450px' },
                        '& .MuiButton-root': { m: 1, width: '450px' },
                        my: 6, mx: 4,
                        marginBottom: "6px",
                        display: 'flex',
                        flexDirection: 'column',
                        alignItems: 'center',
                    }}>
                    <Typography component='img' src={WORDGREETING} alt='greeting' />
                    <TextField
                        type="text"
                        label="Email"
                        value={user}
                        onChange={(e) => setUser(e.target.value)}
                    />

                    <TextField
                        type="number"
                        label="Phone number"
                    />

                    <TextField
                        type="password"
                        label="Password"
                        placeholder="At least 8 character"
                        value={pass}
                        onChange={(e) => setPass(e.target.value)}
                    />

                    <TextField
                        type="password"
                        label="Confirm Password"
                        placeholder="At least 8 character"
                    />
                    <Stack direction="row" spacing={4} display="flex" alignItems="center">
                        <Button variant="contained" color="warning" size="large" onClick={handleSignUp}>
                            Sign up
                        </Button>
                    </Stack>
                    <Typography className="input" component="h1"> Already have an account ? <a href="/login"> Log in </a></Typography>
                </Box>
            </Grid>
            <Grid item xs={6}>
                <img className="signup-image" alt="login" src={SIGNUPBGR} />
            </Grid>
        </Grid >
    )
}


