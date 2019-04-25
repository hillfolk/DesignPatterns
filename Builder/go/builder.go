package builder

// Builder 인터페이스 정의
type Builder interface {
	SetWheels() Builder
	SetSeats() Builder
	SetStructure()Builder
	GetVehicle() VehicleProduct
}


type ManufacturingDirector struct {
	builder Builder
}


func (f *ManufacturingDirector) Construct() {
	f.builder.SetSeats().SetStructure().SetWheels()
}

func (f *ManufacturingDirector) SetBuilder(b Builder){
	f.builder = b
}

type VehicleProduct struct {
	Wheels int
	Seats int
	Structure string
}


type CarBuilder struct {
	v VehicleProduct
}

func (c *CarBuilder) SetWheels() Builder {
	c.v.Wheels = 4
	return c;
}

func (c *CarBuilder) SetSeats() Builder {
	c.v.Seats = 5
	return c;
}

func (c *CarBuilder) SetStructure()Builder {
	c.v.Structure = "Car"
	return c;
}

func (c *CarBuilder) GetVehicle() VehicleProduct {
	return c.v;
}

//A Builder of type motorbike
type BikeBuilder struct {
	v VehicleProduct
}

func (b *BikeBuilder) SetWheels() Builder {
	b.v.Wheels = 2
	return b
}

func (b *BikeBuilder) SetSeats() Builder {
	b.v.Seats = 2
	return b
}

func (b *BikeBuilder) SetStructure() Builder {
	b.v.Structure = "Motorbike"
	return b
}

func (b *BikeBuilder) GetVehicle() VehicleProduct {
	return b.v
}

//A Builder of type motorbike
type BusBuilder struct {
	v VehicleProduct
}

func (b *BusBuilder) SetWheels() Builder {
	b.v.Wheels = 8
	return b
}

func (b *BusBuilder) SetSeats() Builder{
	b.v.Seats = 30
	return b
}

func (b *BusBuilder) SetStructure() Builder {
	b.v.Structure = "Bus"
	return b
}

func (b *BusBuilder) GetVehicle() VehicleProduct {
	return b.v
}
