import { Button, Card, CardMedia, Dialog, DialogActions, DialogContent, DialogTitle, IconButton, Typography } from "@mui/material";
import CloseSharpIcon from '@mui/icons-material/CloseSharp';
import React from "react";

export const ProductModal = ({ selectedProduct, openModal, handleCloseModal }) => {
    return (
        <Dialog open={openModal} onClose={handleCloseModal} maxWidth="md">
            <DialogTitle>
                <IconButton edge="end" onClick={handleCloseModal} aria-label="close">
                    <CloseSharpIcon />
                </IconButton>
            </DialogTitle>
            <DialogContent>
                <Card sx={{ p: 2 }}>
                    <CardMedia
                        component="img"
                        sx={{ maxWidth: '100%', maxHeight: '80vh', objectFit: 'contain' }}
                        image={selectedProduct && selectedProduct.image}
                        alt={selectedProduct && selectedProduct.name}
                    />
                    <Typography variant="h6" align="center" sx={{ mt: 2 }}>
                        {selectedProduct && selectedProduct.name}
                    </Typography>
                </Card>
            </DialogContent>
            <DialogActions>
                <Button onClick={handleCloseModal} color="primary">
                    Close
                </Button>
            </DialogActions>
        </Dialog>
    );
    // return (
    //     <Dialog open={openModal} onClose={handleCloseModal}>
    //         {selectedProduct && (
    //             <React.Fragment>
    //                 <DialogTitle>{selectedProduct.name}</DialogTitle>
    //                 <DialogContent>
    //                     <DialogContentText>{selectedProduct.description}</DialogContentText>
    //                     <DialogContentText>Price: {selectedProduct.price}</DialogContentText>
    //                     <DialogContentText>Category: {selectedProduct.category.name}</DialogContentText>
    //                 </DialogContent>
    //                 <DialogActions>
    //                     <Button onClick={handleCloseModal}>Close</Button>
    //                 </DialogActions>
    //             </React.Fragment>
    //         )}
    //     </Dialog>
    // );
};
