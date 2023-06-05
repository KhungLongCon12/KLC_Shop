import { useState } from "react"
import axios from "axios"
import "../css/login.css"
import SIGNUPBGR from "../assets/img/sign-up.png"
import WORDGREETING from "../assets/img/word-Logo-Remove-BackGr.png"
import { Box, Button, Grid, Stack, TextField, Typography } from "@mui/material"
import { useNavigate } from "react-router-dom"

export function SignUp() {
    const [firstName, setFirstName] = useState('')
    const [lastName, setLastName] = useState('')
    const [userName, setUserName] = useState('')
    const [email, setEmail] = useState()
    const [pass, setPass] = useState()

    const handleSignUp = () => {
        const data = new FormData();
        data.append("first_name", firstName);
        data.append("last_name", lastName);
        data.append("email", email);
        data.append("username", userName);
        data.append("password", pass);
        // const data = {
        //     first_name: firstName,
        //     last_name: lastName,
        //     email: email,
        //     username: userName,
        //     password: pass,
        // };
        axios.post("http://127.0.0.1:8000/register/", data, {
            headers: {
                "Content-Type": "application/x-www-form-urlencoded",
            }
        },)
            .then((resp) => {
                console.log(alert('login thanh cong'));
                console.log(resp.data);
                navigate('/');
            }).catch((err) => {
                console.log(alert('khong thanh cong'))
                console.log("Error", err.message);
            });
    }

    const navigate = useNavigate();

    return (
        <Grid container direction="row" justifyContent="center" alignItems='center' >
            <Grid item xs={6}>
                <Box component="form"
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
                        label="First Name"
                        value={firstName}
                        onChange={(e) => setFirstName(e.target.value)}
                    />


                    <TextField
                        type="text"
                        label="Last Name"
                        value={lastName}
                        onChange={(e) => setLastName(e.target.value)}
                    />

                    <TextField
                        type="email"
                        label="Email"
                        value={email}
                        onChange={(e) => setEmail(e.target.value)}
                    />

                    <TextField
                        type="text"
                        label="UserName"
                        value={userName}
                        onChange={(e) => setUserName(e.target.value)}
                    />

                    <TextField
                        type="password"
                        label="Password"
                        placeholder="At least 8 character"
                        value={pass}
                        onChange={(e) => { setPass(e.target.value) }}
                    />

                    <Stack direction="row" spacing={4} display="flex" alignItems="center">
                        <Button variant="contained" color="warning" size="large" onClick={handleSignUp}>
                            Sign up
                        </Button>
                    </Stack>
                    <Typography className="input" component="h1"> Already have an account ? <a href="/login"> Log in </a></Typography>
                    <Typography className="input" component="h1">
                        <a href="/"> Back to Dyno Store </a>
                    </Typography>
                </Box>
            </Grid>
            <Grid item xs={6}>
                <img className="signup-image" alt="login" src={SIGNUPBGR} />
            </Grid>
        </Grid >
    )
}


