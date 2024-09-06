import React, { useState } from 'react';
import styles from './ImageClick.module.css';

// Automatically require all images in the specified folder
const imagesContext = require.context('@site/static/customerjourney/phased', false, /\.(png|jpe?g|svg)$/);
const images = imagesContext.keys().map(imagesContext);

// Descriptions for each image
const descriptions = [
    "<strong> Data Product preparation:</strong> Before publishing, data owners or data providers must ensure their data asset is suitable for inclusion in a data product offering.",
    "<strong> Participant onboarding:</strong> includes the administrative, technological, and governance processes that an entity undergoes when joining the data space. The entity must provide the necessary registration information for the data space governance body to evaluate its application and, depending on the outcome of the evaluation, trigger the certification mechanisms that make the entity a registered, findable, and trustable participant of the data space. Participating entities can request further attestations from data providers or data intermediaries, so that they can consume/deliver services requiring a further level of trust or certification." ,
    "<strong> Data Product publication:</strong> a data provider participant wants to publish a consumption-ready data asset in the form of a data product offering on the deployEMDS data space. They start by provisioning the technical infrastructure and artifacts (i.e., the data source endpoint, metadata and linked vocabularies, and the definition of usage controls that she can find on a deployEMDS repository (reuse) or build themselves. They then proceed to publish the data source as a data product on the data space. This process is not limited to a mere asset publication on the participant’s (or data intermediary) connector, it also involves providing information to internal and external search tools and activating the asset’s sharing agreement (usage control policies might require custom control functions with additional configurations).",
    "<strong> Data Product survey:</strong> A potential data consumer (e.g., a Requestor, or a Participant) performs an explorative survey of available data in the mobility sector.",
    "<strong> Sharing agreement:</strong> After surveying the potential data product offerings that they are interested in, there might be a case where the data consumer is required to give proof of trust or compliance. Attestation is such a process where the data provider or a trusted entity (a Domain authority or a Trust anchor) grant the attestation to the consumer. Once attested, the data consumer enters in negotiation with the data provider. The resulting data sharing agreement is either refused or put in force. In the latter case, the sharing agreement is registered, for governance purposes, in an observability registry. Data sharing agreements can also undergo a business lifecycle of updates, renewal, revocation, and rating updates in case a value-transfer offering is involved.",
    "<strong> Data sharing:</strong> The data consumer successfully negotiated a data sharing agreement with a data provider that allows a data transfer to take place. The data transfer is managed and controlled by the connectors of both parties (interactively, via a data stream, via a batch file transfer, etc.)."
];

const ImageClick = () => {
    const [currentIndex, setCurrentIndex] = useState(0);

    const handleClick = (index) => {
        setCurrentIndex(index);
    };

    return (
        <div className={styles.container}>
            <div className={styles.imageSection}>
                <img
                    src={images[currentIndex].default}
                    alt="Customer Journey"
                    className={styles.image}
                />

                {/* Description below the image and aligned left */}
                <div className={styles.descriptionSection}>
                    <p dangerouslySetInnerHTML={{ __html: descriptions[currentIndex] }} />
                </div>

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
        </div>
    );
};

export default ImageClick;
