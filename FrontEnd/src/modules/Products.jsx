import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { Grid, Paper, Card, CardMedia, CardContent, Typography, Select, MenuItem, FormControl, InputLabel, Button } from '@mui/material';
import { styled, createTheme, ThemeProvider } from '@mui/material/styles';
import Carousel from 'react-material-ui-carousel';
import { ProductModal } from './ProductModal';
import ReactPaginate from 'react-paginate';
import '../css/products.css'

const theme = createTheme();

const RootPaper = styled(Paper)(({ theme }) => ({
    padding: theme.spacing(2),
    backgroundColor: '#f5f5f5',
}));

const StyledCard = styled(Card)(({ theme }) => ({
    maxWidth: 300,
    margin: '0 auto',
}));

const StyledCardMedia = styled(CardMedia)(({ theme }) => ({
    height: 150,
}));

export function Products() {
    const [products, setProducts] = useState([]);

    const [selectedCategory, setSelectedCategory] = useState('');
    const [openModal, setOpenModal] = useState(false);
    const [selectedProduct, setSelectedProduct] = useState();
    const [currentPage, setCurrentPage] = useState(0);
    const productPerPage = 6

    const handlePageClick = (data) => {
        const selectedPage = data.selected;
        setCurrentPage(selectedPage);
    };

    const offset = currentPage * productPerPage;
    const paginatedProducts = products.slice(offset, offset + productPerPage);

    const pageCount = Math.ceil(products.length / productPerPage);


    useEffect(() => {
        axios.get('http://127.0.0.1:8000/product/')
            .then(response => {
                const results = response.data.results;
                setProducts(results);
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }, []);

    const handleCategoryChange = (event) => {
        setSelectedCategory(event.target.value);
    };

    const handleOpenModal = (product) => {
        console.log("check handle", product)
        setSelectedProduct(product);
        setOpenModal(true);
    };

    const handleCloseModal = () => {
        setOpenModal(false);
    };

    return (
        <ThemeProvider theme={theme}>
            <div style={{ backgroundColor: '#e0e0e0', minHeight: '100vh', marginTop: '1rem' }}>
                <RootPaper>
                    <div style={{ margin: '2rem 0' }}>
                        <Carousel
                            autoPlay={true}
                            animation="fade"
                            interval={5000}
                            indicators={false}
                        >
                            {products.map((product) => (
                                <Paper key={product.id}>
                                    <CardMedia
                                        component="img"
                                        sx={{ height: '800px', objectFit: 'contain' }}
                                        image={product.image}
                                        alt={product.name}
                                    />
                                    <Typography variant="h6" align="center">{product.name}</Typography>
                                </Paper>
                            ))}
                        </Carousel>
                    </div>
                    <div>
                        <Grid container spacing={2} justifyContent="space-between">
                            <Grid item xs={12} sm={4} md={3} lg={2}>
                                <FormControl fullWidth>
                                    <InputLabel id="category-filter-label">Your Laptop</InputLabel>
                                    <Select
                                        label="category"
                                        value={selectedCategory}
                                        onChange={handleCategoryChange}
                                    >
                                        <MenuItem value="">All</MenuItem>
                                        <MenuItem value="5">Acer Nitro</MenuItem>
                                        <MenuItem value="6">Dell</MenuItem>
                                        <MenuItem value="7">MSI</MenuItem>
                                        {/* Add more options here */}
                                    </Select>
                                </FormControl>
                            </Grid>
                            <Grid item xs={12} sm={8} md={9} lg={10}>
                                <Grid container spacing={2}>
                                    {paginatedProducts.map(product => (
                                        <Grid key={product.id} item xs={12} sm={6} md={4} lg={3}>
                                            <StyledCard>
                                                <StyledCardMedia
                                                    image={product.image}
                                                    title={product.name}
                                                />
                                                <CardContent>
                                                    <Typography gutterBottom variant="h5" component="div">
                                                        {product.name}
                                                    </Typography>
                                                    <Typography variant="body2" color="text.secondary">
                                                        {product.description}
                                                    </Typography>
                                                    <Typography variant="body2" color="text.secondary">
                                                        Price: {product.price}
                                                    </Typography>
                                                    <Typography variant="body2" color="text.secondary">
                                                        Category: {product.category.name}
                                                    </Typography>
                                                    <Button onClick={handleOpenModal} variant='contained' color='primary' > Buy </Button>
                                                </CardContent>
                                            </StyledCard>
                                        </Grid>
                                    ))}
                                </Grid>
                                <div style={{ textAlign: "center" }}>
                                    <ReactPaginate
                                        previousLabel={'Previous'}
                                        nextLabel={'Next'}
                                        pageCount={pageCount}
                                        onPageChange={handlePageClick}
                                        containerClassName={'pagination'}
                                        activeClassName={'active'}
                                        pageLinkClassName={'page-link'}
                                        previousLinkClassName={'prev-link'}
                                        nextLinkClassName={'next-link'}
                                        disabledClassName={'disabled'}
                                    />
                                </div>
                            </Grid>
                        </Grid>
                    </div>

                </RootPaper>
                <ProductModal selectedProduct={selectedProduct} openModal={openModal} handleCloseModal={handleCloseModal} />
            </div>
        </ThemeProvider>
    );
};

