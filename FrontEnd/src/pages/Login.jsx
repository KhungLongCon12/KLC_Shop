import "../css/login.css"
import axios from "axios"
import { useState } from "react";
import LOGINIMAGE from "../assets/img/login.svg"
import WORDGREETING from "../assets/img/word-Logo-Remove-BackGr.png"
import RESETPWIMAGE from "../assets/img/reset-password.png"
import { Box, Button, Dialog, DialogActions, DialogContent, DialogTitle, Grid, Stack, TextField, Typography } from "@mui/material"
import { useNavigate } from "react-router-dom";
import LoginIcon from '@mui/icons-material/Login';

export function Login({ onLogin }) {
    // Variable
    const [openDialog, setOpenDialog] = useState(false);
    const [userName, setUserName] = useState();
    const [pass, setPass] = useState();
    //Syntax
    const navigate = useNavigate();

    const handleOpenDialog = () => {
        setOpenDialog(true)
    }

    const handleCloseDialog = () => {
        setOpenDialog(false);
    }

    //Request API
    const handleLogin = () => {
        const data = new FormData();
        data.append("username", userName);
        data.append("password", pass);

        axios.post("http://127.0.0.1:8000/login/", data).then((resp) => {
            console.log('login thanh cong');
            console.log(resp);
            onLogin(userName);
            navigate('/');
        }).catch((err) => {
            console.log('khong thanh cong')
            console.log("Error", err.message);
        });
    }

    return (
        <Grid container direction="row" justifyContent="center" alignItems='center' >
            <Grid item xs={6}>
                <Typography component="img" className="login-image" alt="login" src={LOGINIMAGE} />
            </Grid>
            <Grid item xs={6}>
                <Box
                    sx={{
                        '& .MuiTextField-root': { m: 1, width: '450px' },
                        '& .MuiButton-root': { m: 1 },
                        my: 6, mx: 4,
                        marginBottom: "6px",
                        display: 'flex',
                        flexDirection: 'column',
                        alignItems: 'center',
                    }}>
                    <Typography component='img' src={WORDGREETING} alt='greeting' />
                    <TextField
                        type="text"
                        label="User Name"
                        placeholder="User Name"
                        value={userName}
                        onChange={(e) => setUserName(e.target.value)}
                    />
                    <TextField
                        type="password"
                        label="Password"
                        placeholder="At least 8 character"
                        value={pass}
                        onChange={(e) => setPass(e.target.value)}
                    />
                    <Typography>
                        Forgot your<Button id="my-button" onClick={handleOpenDialog}>password</Button>?
                        <ResetPasswordPopUp open={openDialog} handleClose={handleCloseDialog} />
                    </Typography>
                    <div>
                        <Stack direction="row" spacing={4} display="flex" alignItems="center">
                            <Button variant="contained" color="info" endIcon={<LoginIcon />} onClick={handleLogin} >
                                Login
                            </Button>
                            <Button variant="contained" color="info" endIcon={<LoginIcon />} o onClick={() => { navigate('/') }} >
                                Keep Shopping
                            </Button>
                        </Stack>
                    </div>
                    <Typography className="input" component="h1"> New to Dyno Store ? <a href="/signup"> Sign up </a></Typography>
                </Box>
            </Grid>
        </Grid >
    )
}

const ResetPasswordPopUp = (props) => {
    const { open, handleClose } = props

    const handleReset = () => {
        console.log(alert('Reset success'))
        handleClose();
    }

    return (
        <Dialog
            sx={{
                '& .MuiTextField-root': { m: 3, width: '295px' },
            }}
            open={open}
            onClose={handleClose}
        >
            <DialogTitle>
                Reset Password
            </DialogTitle>
            <DialogContent sx={{ padding: '0px 24px 0px 24px' }}>
                <Grid container direction="row" justifyContent="center" alignItems='center'>
                    <Grid item xs={5}>
                        <Typography component="img" className="reset-image" alt="login" src={RESETPWIMAGE} />
                    </Grid>
                    <Grid item xs={7}>
                        <TextField placeholder="Enter Email" label="Enter phone number/ email" type="text" />
                    </Grid>
                </Grid>
            </DialogContent>
            <DialogActions>
                <Button variant="outlined" onClick={handleClose} >Close</Button>
                <Button variant="outlined" onClick={handleReset} >Reset password</Button>
            </DialogActions>
        </Dialog>
    )
}