import React from 'react';
import {View, Text, StyleSheet} from 'react-native';

export default function App() {
  return (
    <View style={styles.root}>
      <Text style={styles.text}>init</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  root: {
    flex: 1,
    backgroundColor: 'gold',
    justifyContent: 'center',
    alignItems: 'center',
  },
  text: {
    fontSize: 50,
    fontWeight: 'bold',
  },
});
