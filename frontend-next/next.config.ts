import type { NextConfig } from "next";

const nextConfig: NextConfig = {
    webpackDevMiddleware: (config) => {
        config.watchOptions = {
            poll: 1000,           // Check for changes every 1 second
            aggregateTimeout: 300 // Delay rebuild slightly for batch changes
        };
        return config;
    }
};

export default nextConfig;
