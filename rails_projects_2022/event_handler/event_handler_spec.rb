require "rspec/autorun"
require_relative "event_handler"

context EventHandler, ".subscribe" do
    it "returns single stored event handler in an array" do
        subscribed_events = EventHandler.subscribe {|x| x}
        p subscribed_events
        expect(subscribed_events.size).to eq(1) 
    end

    it "returns multiple event handlers in an array" do
        new_subscribed_events = EventHandler.subscribe {|x, y| x + 4 * 250 + y}
        p new_subscribed_events.inspect
        expect(new_subscribed_events.size).to eq(2) 
    end

    it "returns handler already exits" do
        subscribed_events = EventHandler.subscribe {|x| x}
        expect(subscribed_events).to eq("Sorry, handler already exists.")
    end

    it "returns No block given" do
        subscribed_event = EventHandler.subscribe
        expect(subscribed_event).to eq("No block given")
    end
end

context EventHandler, ".unsubscribe" do
    it "removes the matching block from the stored handlers" do
        remaining_subscribed_events = EventHandler.unsubscribe {|x| x}
        expect(remaining_subscribed_events.size).to eq(1) 
    end

    it "returns No block given" do
        remaining_subscribed_events = EventHandler.unsubscribe
        expect(remaining_subscribed_events).to eq("No block given")
    end
end

context EventHandler, ".broadcast" do
    it "it calls all the existing event handlers with arbitrary number of arguments (1,2,3,4)" do
        broadcast_handler_01 = EventHandler.broadcast(1,2,3,4)
        expect(broadcast_handler_01).to eq([1003]) 
    end

    it "it calls all the existing event handlers with arbitrary number of arguments (150, 240)" do
        broadcast_handler_02 = EventHandler.broadcast(150, 240)
        expect(broadcast_handler_02).to eq([1390])
    end

    it "it calls all the existing event handlers with no arguments ()" do
        broadcast_handler_03 = EventHandler.broadcast()
        expect(broadcast_handler_03).to eq("Arguments required")
    end

    it "it returns invalid broadcast event" do
        broadcast_handler_04 = EventHandler.broadcast("John")
        expect(broadcast_handler_04).to eq(["Invalid broadcast event"])
    end
end