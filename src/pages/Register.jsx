import { Box, Button, Grid, Stack, TextField, Typography } from "@mui/material"
import "../css/login.css"
import { useNavigate } from "react-router-dom"
import REGISTERBACKGR from "../assets/img/register.png"
import WORDGREETING from "../assets/img/word-Logo-Remove-BackGr.png"

export function Register() {
    const navigate = useNavigate();

    const authentication = () => {
        navigate('/login');
    }

    return (
        <Grid container direction="row" justifyContent="center" alignItems='center' >
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
                    <Typography id="header"> Sign up </Typography>
                    <TextField type="email" label="Gmail"></TextField>
                    <TextField type="number" label="Phone number"></TextField>
                    <TextField type="password" label="Password" placeholder="At least 8 character" />
                    <TextField type="password" label="Confirm Password" placeholder="At least 8 character" />
                    <Stack direction="row" spacing={4} display="flex" alignItems="center">
                        <Button variant="contained" color="warning" type="submit" onClick={authentication}>
                            Sign up
                        </Button>
                    </Stack>
                    <Typography className="input" component="h1"> Already have an account ? <a href="/Login"> Log in </a></Typography>
                </Box>
            </Grid>
            <Grid item xs={6}>
                <img className="signup-image" alt="login" src={REGISTERBACKGR} />
            </Grid>
        </Grid >
    )
}