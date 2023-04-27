import "../css/login.css"
import { useState } from "react";
import LOGINIMAGE from "../assets/img/login.svg"
import WORDGREETING from "../assets/img/word-Logo-Remove-BackGr.png"
import RESETPWIMAGE from "../assets/img/reset-password.png"
import { Box, Button, Dialog, DialogActions, DialogContent, DialogTitle, Grid, Stack, TextField, Typography } from "@mui/material"
import { useNavigate } from "react-router-dom";
import GoogleIcon from '@mui/icons-material/Google';
import LoginIcon from '@mui/icons-material/Login';

export function Login() {
    const navigate = useNavigate();

    const logSuccess = () => {
        navigate('/')
    }

    const [openDialog, setOpenDialog] = useState(false);

    const handleOpenDialog = () => {
        setOpenDialog(true)
    }

    const handleCloseDialog = () => {
        setOpenDialog(false);
    }

    return (
        <Grid container direction="row" justifyContent="center" alignItems='center' >
            <Grid item xs={6}>
                <Typography component="img" className="login-image" alt="login" src={LOGINIMAGE} />
            </Grid>
            <Grid item xs={6}>
                <Box component="form"
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
                    <TextField type="text" label="Phone number / email" placeholder="Phone number / email" />
                    <TextField type="password" label="Password" placeholder="At least 8 character" />
                    <Typography>
                        Forgot your<Button id="my-button" onClick={handleOpenDialog}>password</Button>?
                        <ResetPasswordPopUp open={openDialog} handleClose={handleCloseDialog} />
                    </Typography>
                    <div>
                        <Stack direction="row" spacing={4} display="flex" alignItems="center">
                            <Button variant="contained" color="info" endIcon={<LoginIcon />} type="submit" onClick={logSuccess} >
                                Login
                            </Button>
                            <Button variant="contained" color="warning" startIcon={<GoogleIcon />} onClick={() => navigate()} >
                                Login with Google
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
        </Dialog >
    )
}