import React, { useState } from 'react';
import styles from './ImageClick.module.css';

// Automatically require all images in the specified folder
const imagesContext = require.context('@site/static/customerjourney/phased', false, /\.(png|jpe?g|svg)$/);
const images = imagesContext.keys().map(imagesContext);

const ImageClick = () => {
    const [currentIndex, setCurrentIndex] = useState(0);

    const handleClick = (index) => {
        setCurrentIndex(index);
    };

    return (
        <div className={styles.container}>
            <img
                src={images[currentIndex].default}
                alt="Customer Journey"
                className={styles.image}
            />
            <div className={styles.thumbnails}>
                {images.map((image, index) => (
                    <img
                        key={index}
                        src={image.default}
                        alt={`Step ${index}`}
                        className={index === currentIndex ? styles.activeThumbnail : styles.thumbnail}
                        onClick={() => handleClick(index)}
                    />
                ))}
            </div>
        </div>
    );
};

export default ImageClick;
